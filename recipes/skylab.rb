include_recipe "applications::php55"
include_recipe "applications::rsync"

execute "install skyab" do
    command "curl -sS https://raw.github.com/Kunstmaan/skylab/master/installer | php && mv skylab.phar /usr/local/bin/skylab"
    not_if { ::File.exists?("/usr/local/bin/skylab") }
end

if platform?('mac_os_x')
    include_recipe "osxdefaults::finder_unhide_home"
end

#Create the project directory
directory "/home/projects" do
      owner "root"
      group "admin"
      mode "0777"
      action :create
      recursive true
end

#Create the backupped-projects directory
directory "/home/backupped-projects" do
      owner "root"
      group "admin"
      mode "0777"
      action :create
      recursive true
end
