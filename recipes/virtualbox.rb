if platform?("mac_os_x")
    dmg_package "VirtualBox" do
        source "http://download.virtualbox.org/virtualbox/4.2.10/VirtualBox-4.2.10-84104-OSX.dmg"
		action :install
		owner node['current_user']
		type "pkg"
		package_id "org.virtualbox.pkg.virtualbox"
    end
elsif platform_family?("debian")
    #nfs-kernel-server is needed for the shared folders
    %w[ virtualbox virtualbox-guest-additions nfs-kernel-server ].each do |pkg|
        package pkg do
            action [:install, :upgrade]
        end
    end
end
