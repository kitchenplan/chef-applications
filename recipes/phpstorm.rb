case node["platform_family"]
    when 'mac_os_x'
        include_recipe "applications::homebrewcask"
        homebrew_cask "phpstorm"
    when 'debian'
        phpstorm_version = "PhpStorm-7.1"
        user = node['current_user']

        remote_file "#{Chef::Config[:file_cache_path]}/#{phpstorm_version}.tar.gz" do
            source "http://download-ln.jetbrains.com/webide/#{phpstorm_version}.tar.gz"
            notifies :run, "bash[install phpstorm]", :immediately
            not_if { File.directory?("/home/#{user}/#{phpstorm_version}") }
        end

        bash "install phpstorm" do
            user "root"
            cwd Chef::Config[:file_cache_path]
            code <<-EOH
                tar -zxf #{phpstorm_version}.tar.gz
                mkdir -p /home/#{user}/#{phpstorm_version}
                mv PhpStorm*/* /home/#{user}/#{phpstorm_version}
                chown -R #{user}:#{user} /home/#{user}/#{phpstorm_version}
            EOH
            action :nothing
        end
end
