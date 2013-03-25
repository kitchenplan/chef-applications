if platform?('mac_os_x')
    dmg_package "PhpStorm" do
        source "http://download.jetbrains.com/webide/PhpStorm-5.0.4.dmg"
        action :install
        owner node['current_user']
    end
elsif platform_family?('debian')
    phpstorm_version = "PhpStorm-6.0"
    user = node['current_user']
    
    remote_file "#{Chef::Config[:file_cache_path]}/#{phpstorm_version}.tar.gz" do
        source "http://download-ln.jetbrains.com/webide/#{phpstorm_version}.tar.gz"
        notifies :run, "bash[install phpstorm]", :immediately
        not_if { File.directory?("/home/#{user}/#{phpstorm_version}") }
    end
    
    bash "install phpstorm" do
        user "root"
        cwd "#{Chef::Config[:file_cache_path]}"
        code <<-EOH
            tar -zxf #{phpstorm_version}.tar.gz
            mkdir -p /home/#{user}/#{phpstorm_version}
            mv PhpStorm*/* /home/#{user}/#{phpstorm_version}
            chown -R #{user}:#{user} /home/#{user}/#{phpstorm_version}
        EOH
        action :nothing
    end
end
