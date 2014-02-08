case node["platform_family"]
    when 'mac_os_x'
        include_recipe "homebrewalt::default"

        package "gnu-tar" do
          action [:install, :upgrade]
        end

        link "/usr/bin/tar" do
            to "/usr/local/bin/gtar"
        end
    when 'debian'
        Chef::Log.debug("This recipe is OSX only")
end


