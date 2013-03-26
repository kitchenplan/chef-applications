if platform?("mac_os_x")
    dmg_package "VLC" do
        dmg_name "vlc-2.0.5"
        volumes_dir "vlc-2.0.5"
        source "http://download.videolan.org/vlc/2.0.5/macosx/vlc-2.0.5.dmg"
        action :install
        owner node['current_user']
    end
elsif platform_family?("debian")
    package "vlc" do
        action [:install, :upgrade]
    end
end
