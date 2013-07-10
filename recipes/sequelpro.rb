dmg_package "Sequel Pro" do
  volumes_dir "Sequel Pro 1.0.2"
  owner node['current_user']
  source "https://sequel-pro.googlecode.com/files/sequel-pro-1.0.2.dmg"
  action :install
end
