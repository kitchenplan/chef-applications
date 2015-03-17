dmg_package "3CXPhone12" do
  source "http://downloads.3cx.com/downloads/3CXPhoneforMac12.dmg"
  action :install
  owner node['current_user']
end
