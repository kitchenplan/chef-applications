include_recipe "applications::virtualbox"

if platform?("mac_os_x")
    dmg_package "Vagrant" do
        source "http://files.vagrantup.com/packages/7e400d00a3c5a0fdf2809c8b5001a035415a607b/Vagrant-1.2.2.dmg"
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
        source "http://files.vagrantup.com/packages/7e400d00a3c5a0fdf2809c8b5001a035415a607b/vagrant_1.2.2_x86_64.deb"
        mode 0644
    end

    dpkg_package "vagrant" do
        source "#{Chef::Config[:file_cache_path]}/vagrant.deb"
        action :install
    end
end
