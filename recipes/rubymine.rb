dmg_package "RubyMine" do
  source "http://download.jetbrains.com/ruby/RubyMine-5.4.3.dmg"
  action :install
  owner node['current_user']
end
