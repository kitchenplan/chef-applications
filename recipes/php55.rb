include_recipe "applications::default"
include_recipe "applications::apache"

if platform?('mac_os_x')
    applications_tap "josegonzalez/php"
    applications_tap "homebrew/dupes"

    package "php54" do |variable|
        options "--with-mysql --with-pgsql"
    end
    
    %w[ php55-apcu php55-memcached php55-inclued php55-http php55-xdebug php55-intl php55-yaml php55-imagick php55-solr php55-twig php55-mcrypt].each do |pkg|
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
    packages = %w[ php5-mysqlnd php5-mcrypt php-apc php5-imagick php5-cli php5-gd php5-memcached php5-curl php5-intl php5-dev php5-sqlite php-pear libmagick++-dev ]
    
    packages.each do |pkg|
        package pkg do
            action [:install, :upgrade]
        end
    end
    
    template "/etc/php5/conf.d/99-kunstmaan.ini" do
        source "php90kunstmaan.erb"
        owner "root"
        mode "0755"
    end
    
    template "/etc/php5/conf.d/50-apc.ini" do
        source "php50apc.erb"
        owner "root"
        mode "0755"
    end
end
