dmg_package "Sublime Text" do
  dmg_name "Sublime%20Text"
  source "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203047.dmg"
  owner node['current_user']
end

link "/usr/local/bin/subl" do
  to "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
end

sublime_package_path = ["#{node['etc']['passwd'][node['current_user']]['dir']}/Library/Application Support/Sublime Text 3", "Packages"]
sublime_user_path = sublime_package_path.dup << "User"

recursive_directories sublime_user_path do
  owner node['current_user']
end

node["sublime_text_packages"].each do |package|
  applications_sublime_package package["name"] do
    source package["source"]
    branch package["branch"]
    destination File.join(sublime_package_path)
    owner node['current_user']
  end
end

template File.expand_path("Preferences.sublime-settings", File.join(sublime_user_path)) do
  source "sublime_text-Preferences.sublime-settings.erb"
  owner node['current_user']
  action :create_if_missing
end

package_dir = "#{node['etc']['passwd'][node['current_user']]['dir']}/Library/Application Support/Sublime Text 3/Installed Packages"
filename    = "Package Control.sublime-package"

recursive_directories(["#{node['etc']['passwd'][node['current_user']]['dir']}/Library/Application Support", "Sublime Text 3", "Installed Packages"]) do
  owner node['current_user']
end

remote_file "#{package_dir}/#{filename}" do
  source 'http://sublime.wbond.net/Package%20Control.sublime-package'
  owner node['current_user']
  :create_if_missing
end
