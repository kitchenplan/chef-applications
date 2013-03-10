dmg_package "RubyMine" do
  source "http://download.jetbrains.com/ruby/RubyMine-5.0.2.dmg"
  action :install
  owner node['current_user']
end
