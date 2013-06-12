applications_package "HipChat" do
    source  "http://downloads.hipchat.com.s3.amazonaws.com/mac-beta/HipChat-0.34-01uennzomg01wmg.zip"
    only_if { platform?('mac_os_x') }
end
