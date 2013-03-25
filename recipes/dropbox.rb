if platform?("mac_os_x")
    dmg_package "Dropbox" do
        volumes_dir "Dropbox Installer"
        source "https://www.dropbox.com/download?plat=mac"
        action :install
        owner node['current_user']
    end
elsif platform_family?("debian")
    include_recipe "apt"

    package "nautilus-dropbox" do
        action [:install, :upgrade]
    end
end
