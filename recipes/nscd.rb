case node["platform_family"]
    when 'mac_os_x'
        Chef::Log.debug("This recipe is debian only")
    when 'debian'
        service "nscd" do
            supports [:restart]
        end

        package "nscd" do
            action [:install, :upgrade]
            notifies :restart, "service[nscd]"
        end
end


