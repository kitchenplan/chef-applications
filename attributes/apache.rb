if node['platform_version'] >= "13.10"
    default['apache']['version'] = "2.4"
    default['apache']['pid_file']    = '/var/run/apache2/apache2.pid'
else
    default['apache']['version'] = "2.2"
    default['apache']['pid_file']    = '/var/run/apache2.pid'
end

default['apache']['contact'] = "support@kunstmaan.be"
default['apache']['listen_ports'] = ['80', '443']
default['apache']['serversignature'] = "Off"
default['apache']['servertokens'] = "Prod"
default['apache']['traceenable'] = "Off"
default['apache']['default_site_enabled'] = false
default['apache']['keepalivetimeout'] = "1"
default['apache']['prefork']['startservers'] = "5"
default['apache']['prefork']['minspareservers'] = "5"
default['apache']['prefork']['maxspareservers'] = "10"
default['apache']['prefork']['serverlimit'] = "256"
default['apache']['prefork']['maxclients'] = "150"
default['apache']['prefork']['maxrequestsperchild'] = "0"
default['apache']['worker']['startservers'] = "2"
default['apache']['worker']['serverlimit'] = "64"
default['apache']['worker']['maxclients'] = "150"
default['apache']['worker']['minsparethreads'] = "25"
default['apache']['worker']['maxsparethreads'] = "75"
default['apache']['worker']['threadsperchild'] = "25"
default['apache']['worker']['maxrequestsperchild'] = "0"
default['apache']['mod_fastcgi']['default_config'] = false
