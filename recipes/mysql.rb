include_recipe "applications::default"

if platform?('mac_os_x')
    #http://solutions.treypiepmeier.com/2010/02/28/installing-mysql-on-snow-leopard-using-homebrew/
    require 'pathname'

        ["homebrew.mxcl.mysql.plist" ].each do |plist|
            plist_path = File.expand_path(plist, File.join('~', 'Library', 'LaunchAgents'))
            if File.exists?(plist_path)
                log "mysql plist found at #{plist_path}"
                execute "unload the plist (shuts down the daemon)" do
                    command %'launchctl unload -w #{plist_path}'
                    user node['current_user']
                end
            else
                log "Did not find plist at #{plist_path} don't try to unload it"
            end
        end

    PASSWORD = node["mysql_root_password"]
    # The next two directories will be owned by WS_USER
    DATA_DIR = "/usr/local/var/mysql"
    PARENT_DATA_DIR = "/usr/local/var"

    [ "/Users/#{node['current_user']}/Library/LaunchAgents",
      PARENT_DATA_DIR,
      DATA_DIR ].each do |dir|
      directory dir do
        owner node['current_user']
        action :create
      end
    end

    package "mysql" do
      action [:install, :upgrade]
    end

    execute "copy over the plist" do
        command %'cp /usr/local/Cellar/mysql/5.*/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/'
        user node['current_user']
    end

    ruby_block "mysql_install_db" do
      block do
        active_mysql = Pathname.new("/usr/local/bin/mysql").realpath
        basedir = (active_mysql + "../../").to_s
        data_dir = "/usr/local/var/mysql"
        system("mysql_install_db --verbose --user=#{node['current_user']} --basedir=#{basedir} --datadir=#{DATA_DIR} --tmpdir=/tmp && chown #{node['current_user']} #{data_dir}") || raise("Failed initializing mysqldb")
      end
      not_if { File.exists?("/usr/local/var/mysql/mysql/user.MYD")}
    end

    execute "start the daemon" do
      command %'launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
      user node['current_user']
    end

    ruby_block "Checking that mysql is running" do
      block do
        Timeout::timeout(60) do
          until system("ls /tmp/mysql.sock")
            sleep 1
          end
        end
      end
    end
    
    execute "set the root password to the default" do
        command "mysqladmin -uroot password #{PASSWORD}"
        not_if "mysql -uroot -p#{PASSWORD} -e 'show databases'"
    end
elsif platform_family?('debian')
    
    include_recipe "percona::client"
    include_recipe "percona::server"
    
    apt_repository "percona" do
        uri "http://repo.percona.com/apt"
        distribution node["lsb"]["codename"]
        components ["main"]
        keyserver "keys.gnupg.net"
        key "1C4CBDCDCD2EFD2A"
        action :add
        notifies :run, "execute[apt-get update]", :immediately
    end

    %w[percona-server-server-5.5 percona-server-client-5.5 percona-toolkit libmysqlclient-dev].each do |pkg|
        package pkg do
            action [:install, :upgrade]
        end
    end
end


