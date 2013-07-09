if platform?("mac_os_x")
    dmg_package "VirtualBox" do
        source "http://download.virtualbox.org/virtualbox/4.2.16/VirtualBox-4.2.16-86992-OSX.dmg"
        action :install
        owner node['current_user']
        type "pkg"
        package_id "org.virtualbox.pkg.virtualbox"
    end
elsif platform_family?("debian")
    apt_repository "virtualbox" do
        uri "http://download.virtualbox.org/virtualbox/debian"
        distribution node["lsb"]["codename"]
        components ["contrib"]
        keyserver "keys.gnupg.net"
        key "54422A4B98AB5139"
        action :add
        notifies :run, "execute[apt-get update]", :immediately
    end

    %w[ virtualbox-4.2 ].each do |pkg|
        package pkg do
            action [:install, :upgrade]
        end
    end
end
