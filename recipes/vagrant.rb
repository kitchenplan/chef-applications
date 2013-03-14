include_recipe "applications::virtualbox"

if platform?("mac_os_x")
    dmg_package "Vagrant" do
        source "http://files.vagrantup.com/packages/476b19a9e5f499b5d0b9d4aba5c0b16ebe434311/Vagrant.dmg"
        action :install
        type "pkg"
        owner node['current_user']
        package_id "com.vagrant.vagrant"
    end
elsif platform_family?("debian")
    package "vagrant" do
        action [:install, :upgrade]
    end
end
