include_recipe "applications::default"

case node["platform_family"]
    when 'mac_os_x'
        package "htop-osx" do
            action [:install, :upgrade]
        end
    when 'debian'
        package "htop" do
            action [:install, :upgrade]
        end
end
