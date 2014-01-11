case node["platform_family"]
    when 'mac_os_x'
        Chef::Log.debug("This recipe is debian only")
    when 'debian'
        package "php5-fpm" do
            action [:install, :upgrade]
        end

        execute "set the runlevels" do
            user "root"
            command "sysv-rc-conf --level 2345 php5-fpm on"
        end
end







