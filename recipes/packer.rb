case node["platform_family"]
    when 'mac_os_x'
        include_recipe "homebrewalt::default"
        homebrewalt_tap "homebrew/binary"
        package "packer"
    when 'debian'
        Chef::Log.debug("This recipe is OSX only")
end
