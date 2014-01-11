case node["platform_family"]
    when 'mac_os_x'
        Chef::Log.debug("This recipe is debian only")
    when 'debian'
        packages = %w[build-essential python-setuptools python-dev python-software-properties software-properties-common optipng jpegoptim curl htop ntp ffmpeg2theora spamassassin iftop iotop jhead]

        packages.each do |pkg|
            package pkg do
                action [:install, :upgrade]
            end
        end
        #You can't place linux-headers-`uname -r` in the list, if you do it throws an error
        package "linux-headers-`uname -r`" do
            action [:install, :upgrade]
        end
end
