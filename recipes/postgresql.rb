include_recipe "homebrewalt::default"

if Mixlib::ShellOut.new("sudo -u #{node['current_user']} brew list -1 | grep ^postgresql$").empty?
    ["homebrew.mxcl.postgresql.plist", "org.postgresql.postgres.plist" ].each do |plist|
        plist_path = File.expand_path(plist, File.join('~', 'Library', 'LaunchAgents'))
        if File.exists?(plist_path)
            log "postgres plist found at #{plist_path}"
            execute "unload the plist (shuts down the daemon)" do
                command %'launchctl unload -w #{plist_path}'
                user node['current_user']
            end
        else
            log "Did not find plist at #{plist_path} don't try to unload it"
        end
    end

    include_recipe "applications::increase_shared_memory"

    package "postgresql" do
        #options "--no-tcl --without-python"
        action [:install, :upgrade]
    end

    # blow away default image's data directory
    directory "/usr/local/var/postgres" do
        action :delete
        recursive true
    end

    execute "create the database" do
        command "/usr/local/bin/initdb -U postgres --encoding=utf8 --locale=en_US /usr/local/var/postgres "
        user node['current_user']
    end

    template "/usr/local/var/postgres/postgresql.conf" do
        source "postgresql.conf.erb"
        owner node['current_user']
        group "staff"
        mode "0600"
    end

    launch_agents_path = File.expand_path('.', File.join('~','Library', 'LaunchAgents'))
    directory launch_agents_path do
        action :create
        recursive true
        owner node['current_user']
    end

    execute "copy over the plist" do
        command %'cp /usr/local/Cellar/postgresql/9.*/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/'
        user node['current_user']
    end

    execute "start the daemon" do
        command %'launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
        user node['current_user']
    end

    ruby_block "wait four seconds for the database to start" do
        block do
            sleep 4
        end
    end

    execute "create the database" do
        command "/usr/local/bin/createdb -U postgres -h /tmp/"
        user node['current_user']
    end

    execute "create the postgres '#{node['current_user']}' superuser" do
        command "/usr/local/bin/createuser -U postgres -h /tmp/ --superuser #{node['current_user']}"
        user node['current_user']
    end
end

ruby_block "test to see if postgres is running" do
    block do
        require 'socket'
        postgres_port = 5432
        begin
            s = TCPSocket.open('localhost',postgres_port)
        rescue => e
            raise "postgres is not running"
        end
        s.close
        Mixlib::ShellOut.new("sudo -u #{node['current_user']} /usr/local/bin/psql -U postgres -h /tmp/ < /dev/null")
        if $?.to_i != 0
            raise "I couldn't invoke postgres!"
        end
    end
end
