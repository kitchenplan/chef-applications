include_recipe "homebrew::default"

package "bash" do
  action :install
end

execute "set the root user shell to bash" do
  command "dscl . -create /Users/root UserShell /usr/local/bin/bash"
end

execute "set the root user shell to bash" do
  command "dscl . -create /Users/#{node['current_user']} UserShell /usr/local/bin/bash"
end

link "/root" do
    to "/var/root"
end
