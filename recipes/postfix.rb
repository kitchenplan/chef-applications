case node["platform_family"]
    when 'mac_os_x'
        Chef::Log.debug("This recipe is debian only")
    when 'debian'
        package "postfix" do
            action [:install, :upgrade]
        end

        service "postfix" do
            supports [:restart]
        end

        template "/etc/postfix/main.cf" do
            source "postfix.erb"
            owner "root"
            mode "0644"
            variables(
                :hostname => node['dotfiles']['kdeploy']['hostname']+"."+node['postfix']['domain']
            )
            notifies :restart, "service[postfix]"
        end

        script "use correct mailname" do
            interpreter "bash"
            user "root"
            code <<-EOH
                echo "#{node['dotfiles']['kdeploy']['hostname']+"."+node['postfix']['domain']}" > /etc/mailname
            EOH
        end
end
