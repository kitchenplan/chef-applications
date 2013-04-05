dmg_package "Chicken" do
    source "http://garr.dl.sourceforge.net/project/chicken/Chicken-2.2b2.dmg"
    action :install
    only_if platform?('mac_os_x')
end
