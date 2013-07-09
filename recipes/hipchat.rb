applications_package "HipChat" do
    source  "http://downloads.hipchat.com.s3.amazonaws.com/osx/HipChat-2.0.zip"
    only_if { platform?('mac_os_x') }
end
