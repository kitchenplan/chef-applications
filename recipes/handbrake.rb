dmg_package "HandBrake" do
    source "http://downloads.sourceforge.net/project/handbrake/0.9.9/HandBrake-0.9.9-MacOSX.6_GUI_x86_64.dmg"
    action :install
    volumes_dir "HandBrake-0.9.9-MacOSX.6_GUI_x86_64"
    only_if { platform?('mac_os_x') }
end
