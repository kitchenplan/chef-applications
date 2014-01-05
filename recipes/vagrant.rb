include_recipe "applications::virtualbox"

if platform?("mac_os_x")
    include_recipe "applications::homebrewcask"
    applications_cask "vagrant"
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

node["vagrant_plugins"].each do |plugin|
  execute "install vagrant plugin #{plugin}" do
    command "vagrant plugin install #{plugin}"
    user node['current_user']
    not_if "vagrant plugin list | grep #{plugin}"
  end
end
