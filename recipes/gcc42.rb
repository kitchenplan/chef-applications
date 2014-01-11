case node["platform_family"]
    when 'mac_os_x'
        homebrew_tap "homebrew/dupes"
        package "apple-gcc42" do
          action [:install, :upgrade]
        end
    when 'debian'
        Chef::Log.debug("This recipe is OSX only")
end
