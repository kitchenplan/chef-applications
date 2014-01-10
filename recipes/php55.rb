include_recipe "applications::default"
include_recipe "applications::apache"
include_recipe "applications::postgresql"
include_recipe "applications::mysql"

if platform?('mac_os_x')

    homebrew_tap "homebrew/dupes"
    homebrew_tap "josegonzalez/php"

    package "php55" do |variable|
        options "--with-mysql --with-pgsql --with-imap"
    end

    %w[ php55-apcu php55-http php55-xdebug php55-intl php55-yaml php55-imagick php55-solr php55-twig php55-mcrypt php55-mongo php55-memcached].each do |pkg|
        package pkg do
            action [:install, :upgrade]
        end
    end

    template "/usr/local/etc/php/5.5/conf.d/99-kunstmaan.ini" do
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
