include_recipe "applications::default"
include_recipe "applications::apache"

if platform?('mac_os_x')
    homebrew_tap "josegonzalez/php"
    homebrew_tap "homebrew/dupes"

    package "php54" do |variable|
        options "--with-mysql --with-pgsql --with-imap"
    end

    %w[ php54-apc php54-inclued php54-http php54-xdebug php54-intl php54-yaml php54-imagick php54-solr php54-mongo php54-memcached php54-twig php54-mcrypt].each do |pkg|
        package pkg do
            action [:install, :upgrade]
        end
    end

    template "/usr/local/etc/php/5.4/conf.d/99-kunstmaan.ini" do
        source "php90kunstmaan.erb"
        owner node['current_user']
        mode "0644"
    end

    template "/etc/apache2/other/php.conf" do
      source "apache_php.erb"
      owner node['current_user']
      mode "0755"
    end
elsif platform_family?('debian')
    if node['platform_version'] == "12.04"
        r = apt_repository "php-5.4" do
          uri "http://ppa.launchpad.net/ondrej/php5-oldstable/ubuntu"
          distribution node['lsb']['codename']
          components ["main"]
          keyserver "keyserver.ubuntu.com"
          key "E5267A6C"
          action :nothing
        end
        r.run_action(:add)
    end

    include_recipe "php::default"
    include_recipe "php::fpm"
    include_recipe "php::module_common"
    include_recipe "php::module_mysql"
    include_recipe "php::module_pgsql"
    include_recipe "php::module_curl"
    include_recipe "php::module_xml"
    include_recipe "php::module_memcache"
    include_recipe "imagemagick::default"

    package "php5-imagick" do
      action :install
      notifies :restart, "service[php5-fpm]"
    end

    include_recipe "php::module_apc"

    execute "Disable default apc-configuration" do
       command "php5dismod apc"
        not_if "test ! -e /etc/php5/conf.d/20-apc.ini"
    end
end
