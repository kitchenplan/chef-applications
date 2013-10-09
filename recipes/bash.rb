include_recipe "applications::default"

if platform_family?('mac_os_x')

    execute "set the root user shell to bash" do
      command "dscl . -create /Users/root UserShell /bin/bash"
    end

    link "/root" do
        to "/var/root"
    end

end
