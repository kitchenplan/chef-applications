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
    #nfs-kernel-server is needed for the shared folders
    %w[ nfs-kernel-server ].each do |pkg|
        package pkg do
            action [:install, :upgrade]
        end
    end

    remote_file "#{Chef::Config[:file_cache_path]}/vagrant.deb" do
        source "http://files.vagrantup.com/packages/64e360814c3ad960d810456add977fd4c7d47ce6/vagrant_x86_64.deb"
        mode 0644
    end

    dpkg_package "vagrant" do
        source "#{Chef::Config[:file_cache_path]}/vagrant.deb"
	action :install
    end
end
