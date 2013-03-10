include_recipe "applications::default"

if platform_family?('mac_os_x')

    package "htop-osx" do
        action [:install, :upgrade]
    end

else

    package "htop" do
        action [:install, :upgrade]
    end

end
