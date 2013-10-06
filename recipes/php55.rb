include_recipe "applications::default"
include_recipe "applications::apache"

if platform?('mac_os_x')

    execute "get packager" do
        command "curl -s -o /tmp/packager.tgz http://php-osx.liip.ch/packager/packager.tgz && tar -C /usr/local -xzf /tmp/packager.tgz"
        user node['current_user']
    end
    execute "run packager" do
        command "/usr/local/packager/packager.py install 5.5-10.8-frontenddev"
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
