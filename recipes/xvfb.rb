if platform_family?('debian')
    %w[xvfb sysv-rc-conf].each do |pkg|
        package pkg do
            action [:install, :upgrade]
        end
    end
    
    service "xvfb" do
        supports [:start, :restart]
    end
    
    #Create the required directories
    %w[/etc/X11/xserver /usr/lib/xserver].each do |dir|
        directory dir do
            owner "root"
            group "root"
            mode 0755
            action :create
            recursive true
        end
    end
    
    #touch the required files
    %w[/etc/X11/xserver/SecurityPolicy /usr/lib/xserver/SecurityPolicy].each do |f|
        file f do
            owner "root"
            group "root"
            mode 0644
            action :touch
        end
    end
    
    template "/etc/init.d/xvfb" do
        source "xvfb.erb"
        owner "root"
        mode 0755
        notifies :start, "service[xvfb]"
    end
    
    execute "init runlevel on xvfb" do
        user "root"
        command 'sysv-rc-conf --level 2345 xvfb on'
    end

end
