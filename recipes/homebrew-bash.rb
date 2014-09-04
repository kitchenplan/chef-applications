include_recipe "homebrewalt::default"

case node["platform_family"]
    when 'mac_os_x'
        homebrewalt_tap "homebrew/dupes"
        package "bash" do
          action [:install, :upgrade]
        end
        execute "set the root user shell to bash" do
          command "sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'"
          command "sudo chsh -s /usr/local/bin/bash #{node['current_user']}"
        end

        link "/root" do
            to "/var/root"
        end
    when 'debian'
        Chef::Log.debug("This recipe is OSX only")
end
