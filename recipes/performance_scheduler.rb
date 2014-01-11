case node["platform_family"]
    when 'mac_os_x'
        Chef::Log.debug("This recipe is debian only")
    when 'debian'
        service "ondemand" do
            action :start
        end

        execute "Configure the scheduler" do
            user "root"
            command 'sed -i "s/\([^/]\)ondemand/\1performace/g" /etc/init.d/ondemand'
            notifies :start, "service[ondemand]"
        end
end



