if platform?("ubuntu")
    node["ubuntu"]["desktop"]["packages"].each do |pkg|
        package pkg do
            action [:install, :upgrade]
        end
    end
    
    execute "set gdm as default display-manager" do
        command "dpkg-reconfigure gdm"
        user "root"
        not_if "cat /etc/X11/default-display-manager | grep '/usr/sbin/gdm'"
    end
end
