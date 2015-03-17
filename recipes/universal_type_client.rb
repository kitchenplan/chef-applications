remote_file "#{Chef::Config[:file_cache_path]}/UTC-4-2-3-M.zip" do
  source "http://bin.extensis.com/UTC-4-2-3-M.zip"
  owner node['current_user']
  not_if { ::File.exists?("/Applications/Universal Type Client.app")}
end

execute "unzip UTC-4-2-3-M.zip" do
  command "unzip #{Chef::Config[:file_cache_path]}/UTC-4-2-3-M.zip -d #{Chef::Config[:file_cache_path]}/"
  user node['current_user']
  not_if { ::File.exists?("/Applications/Universal Type Client.app")}
end

execute "install Universal Type Client 4.2.3.pkg" do
  command "installer -pkg '#{Chef::Config[:file_cache_path]}/Universal Type Client 4.2.3.pkg' -target /"
  action :run
  not_if { ::File.exists?("/Applications/Universal Type Client.app")}
end
