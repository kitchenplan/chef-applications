include_recipe "homebrewalt::default"

homebrewalt_tap "homebrew/dupes"

package "bash" do
  action [:install, :upgrade]
end

execute "add the homebrew bash to shells" do
  command "echo /usr/local/bin/bash >> /etc/shells && touch #{Chef::Config[:file_cache_path]}/.add-homebrew-bash-to-shells-success"
  user 'root'
  not_if do ::File.exists?("#{Chef::Config[:file_cache_path]}/.add-homebrew-bash-to-shells-success") end
end

execute "change shell for the current user" do
  command "chsh -s /usr/local/bin/bash #{node['current_user']}"
  user 'root'
end
