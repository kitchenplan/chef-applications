dmg_package "Synergy" do
  source "http://synergy.googlecode.com/files/synergy-1.4.10-MacOSX108-x86_64.dmg"
  action :install
  owner node['current_user']
end



