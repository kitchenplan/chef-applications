%w{
  /etc/apache2/conf/projects.d
  /etc/apache2/logs
  /etc/tomcat
  /home/projects
  /home/backupped-projects
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

%w{/etc/apache2/conf/projects.d/namevirtualhosts /etc/apache2/workers.properties}.each do |pkg|
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
