include_recipe "applications::default"

case node["platform_family"]
    when 'mac_os_x'
        package "gnu-tar" do
          action [:install, :upgrade]
        end

        link "/usr/bin/tar" do
            to "/usr/local/bin/gtar"
        end
    when 'debian'
        Chef::Log.debug("This recipe is OSX only")
end


