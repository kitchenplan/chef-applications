include_recipe 'applications::git'

if platform_family?('debian')
    ## Need fix for OSX
    include_recipe "root_ssh_agent::env_keep"
    include_recipe "root_ssh_agent::ppid"
end

if platform?('mac_os_x')
    include_recipe 'osxdefaults::finder_unhide_home'
elsif platform_family?('debian')
    include_recipe 'applications::essentials'
end

#Include recipes for required packages
include_recipe 'applications::postgresql'
include_recipe 'applications::psycopg2'
include_recipe 'applications::mysql'
include_recipe 'applications::mysql_python'
include_recipe 'applications::apache'
include_recipe "applications::#{node['kdeploydeps']['php']}"

#Packages required for the debian family
if platform_family?('debian')
    include_recipe 'applications::mysql_workbench'
#    include_recipe 'applications::acl'
    include_recipe 'applications::server_tuning'
    include_recipe 'applications::postfix'
    include_recipe 'applications::java'
end

#Only the servers need newrelic and Varnish
unless Chef::Config[:solo]
    include_recipe 'applications::varnish'
    include_recipe 'applications::newrelic'
end
