case node["platform_family"]
    when 'mac_os_x'
        Chef::Log.debug("This recipe is debian only")
    when 'debian'
        %w[pidgin pidgin-plugin-pack libpurple-dev].each do |pkg|
            package pkg do
                action [:install, :upgrade]
            end
        end

        git "#{Chef::Config[:file_cache_path]}/pidgin_campfire" do
            repository "https://github.com/jrfoell/campfire-libpurple.git"
            reference "master"
            action :sync
            notifies :run, "bash[install_campfire_plugin]", :immediately
        end

        bash "install_campfire_plugin" do
            user "root"
            cwd "#{Chef::Config[:file_cache_path]}/pidgin_campfire"
            code <<-EOH
                make && make install
            EOH
            action :nothing
        end
end
