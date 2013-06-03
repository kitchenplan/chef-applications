dmg_package "Skype" do
    source "http://www.skype.com/go/getskype-macosx.dmg"
    action :install
    only_if { platform?('mac_os_x') }
end
