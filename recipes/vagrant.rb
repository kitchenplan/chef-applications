include_recipe "applications::virtualbox"

if platform?("mac_os_x")
    dmg_package "Vagrant" do
        source "http://files.vagrantup.com/packages/194948999371e9aee391d13845a0bdeb27e51ac0/Vagrant.dmg"
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

