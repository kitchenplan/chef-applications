if platform?("mac_os_x")
    dmg_package "VirtualBox" do
        source "http://download.virtualbox.org/virtualbox/4.2.8/VirtualBox-4.2.8-83876-OSX.dmg"
		action :install
		owner node['current_user']
		type "pkg"
		package_id "org.virtualbox.pkg.virtualbox"
    end
elsif platform_family?("debian")
    package "virtualbox" do
        action [:install, :upgrade]
    end
end
