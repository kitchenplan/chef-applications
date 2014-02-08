case node["platform_family"]
    when 'mac_os_x'
        execute "set the root user shell to bash" do
          command "dscl . -create /Users/root UserShell /bin/bash"
        end

        link "/root" do
            to "/var/root"
        end
    when 'debian'
        Chef::Log.debug("This recipe is OSX only")
end
