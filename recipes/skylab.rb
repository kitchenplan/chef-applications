include_recipe "osxdefaults::finder_unhide_home"

%w{
  /etc/apache2/sites-available
  /etc/apache2/sites-enabled
  /etc/apache2/logs
  /etc/tomcat
  /home/projects
  /home/backupped-projects
  /etc/libapache2-mod-jk
  /opt/nowebsite
  /opt/jdk
}.each do |dir|
  directory dir do
    owner 'root'
    group 'root'
    mode 0777
    action :create
    recursive true
  end
end

%w{/etc/libapache2-mod-jk/workers.properties}.each do |pkg|
    file pkg do
        owner "root"
        group value_for_platform(
            "mac_os_x" => { "default" => "admin" },
            "default" => "root"
        )
        mode 0777
        action :touch
    end
end

otherlocation = value_for_platform(
    ["ubuntu"] => { "default" => "/etc/apache2/conf.d"},
    "default" => "/etc/apache2/other"
)

template "#{otherlocation}/skylab.conf" do
    source "apache/skylab.conf.erb"
    owner "root"
    group value_for_platform(
        "mac_os_x" => { "default" => "admin" },
        "default" => "root"
    )
    mode "0644"
    variables(
        :user => node['current_user']
    )
end

include_recipe "applications::postgresql"

postgresuser = value_for_platform(
    ["ubuntu"] => { "default" => "postgres"},
    "default" => node['current_user']
)

dblocation = value_for_platform(
    ["ubuntu"] => { "default" => "/var/lib/postgresql"},
    "default" => "/usr/local/var/postgres"
)

execute "create the postgresql Skylab superuser" do
   command "psql -d template1 -c 'create user skylab with SUPERUSER;' && touch #{dblocation}/.create-postgresql-skylab-user-success"
    user postgresuser
    not_if do ::File.exists?("#{dblocation}/.create-postgresql-skylab-user-success") end
end

execute "create the postgresql Skylab superuser password" do
    command "psql  -d template1 -c \"alter user skylab with password '#{node['skylab']['postgresql']['password']}';\" && touch #{dblocation}/.set-postgresql-skylab-password-success"
    user postgresuser
    not_if do ::File.exists?("#{dblocation}/.set-postgresql-skylab-password-success") end
end

execute "grant the postgresql Skylab superuser" do
    command "psql -d template1 -c 'GRANT SELECT ON pg_shadow TO skylab;' && touch #{dblocation}/.grant-postgresql-skylab-user-success"
    user postgresuser
    not_if do ::File.exists?("#{dblocation}/.grant-postgresql-skylab-user-success") end
end

git "/opt/skylab" do
    repository "https://github.com/Kunstmaan/skylab.git"
    user node['current_user']
    reference "master"
    enable_checkout false
    action :sync
end

execute "get-skylab" do
    user node['current_user']
    cwd "/usr/local/bin/"
    command "curl -sSL https://raw.github.com/Kunstmaan/skylab/master/installer | php"
end
execute "mv-skylab" do
    cwd "/usr/local/bin/"
    command "mv skylab.phar /usr/local/bin/skylab"
end

link '/opt/jdk/default' do
  to '/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home'
  user 'root'
end

template "/etc/skylab.yml" do
    source "skylab.yml.erb"
end
