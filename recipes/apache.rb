include_recipe "homebrew::default"

template "/etc/apache2/other/kdeploy.conf" do
  source "apache_kdeploy.erb"
  owner "root"
  mode "0755"
  variables(
    :user => node['current_user']
  )
end

directory "/etc/apache2/conf/projects.d" do
  owner "root"
  group "admin"
  mode 0777
  action :create
  recursive true
end

directory "/etc/apache2/logs" do
  owner "root"
  group "admin"
  mode 0777
  action :create
  recursive true
end

directory "/opt/nowebsite" do
  owner "root"
  group "admin"
  mode 0777
  action :create
  recursive true
end

file "/etc/apache2/conf/projects.d/namevirtualhosts" do
  owner "root"
  mode 0777
  action :create
end

file "/etc/apache2/workers.properties" do
  owner "root"
  mode 0777
  action :touch
end
