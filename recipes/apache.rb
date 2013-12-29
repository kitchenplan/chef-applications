include_recipe "applications::packagemanager"

case node["platform_family"]
    when 'mac_os_x'
        # Nothing specific needs to happen for OSX
    when 'debian'
        include_recipe "apache2::default"
        include_recipe "apache2::mod_alias"
        include_recipe "apache2::mod_auth_basic"
        include_recipe "apache2::mod_auth_digest"
        include_recipe "apache2::mod_deflate"
        include_recipe "apache2::mod_expires"
        include_recipe "apache2::mod_fastcgi"
        include_recipe "apache2::mod_headers"
        include_recipe "apache2::mod_mime"
        include_recipe "apache2::mod_proxy"
        include_recipe "apache2::mod_proxy_ajp"
        include_recipe "apache2::mod_proxy_balancer"
        include_recipe "apache2::mod_proxy_connect"
        include_recipe "apache2::mod_proxy_http"
        include_recipe "apache2::mod_rewrite"
        include_recipe "apache2::mod_status"
        include_recipe "apache2::mod_ssl"
        include_recipe "apache2::mod_jk"
        include_recipe "apache2::mod_actions"
        include_recipe "apache2::mod_filter"
        include_recipe "apache2::logrotate"

        template "/etc/apache2/mods-enabled/jk.conf" do
            source "apache/jk.conf.erb"
            owner "root"
            mode "0644"
            notifies :restart, "service[apache2]"
        end

        template "/etc/apache2/mods-available/fastcgi.conf" do
            source "apache/fastcgi.conf.erb"
            owner "root"
            mode "0644"
            notifies :restart, "service[apache2]"
        end

        template "/etc/apache2/conf.d/proxy-logging.conf" do
            source "apache/proxy-logging.conf.erb"
            owner "root"
            mode "0644"
            notifies :restart, "service[apache2]"
        end
    end

