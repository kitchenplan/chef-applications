if platform?('mac_os_x')
    dmg_package "Chicken" do
        source "http://garr.dl.sourceforge.net/project/chicken/Chicken-2.2b2.dmg"
        action :install
    end
end
