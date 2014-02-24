include_recipe "homebrewalt::default"

homebrewalt_cask "sublime-text3"

sublime_path = "#{node['etc']['passwd'][node['current_user']]['dir']}/Library/Application Support/Sublime Text 3"
sublime_package_path = "#{sublime_path}/Packages"
sublime_user_path = "#{sublime_package_path}/User"
sublime_installed_packages_path = "#{sublime_path}/Installed Packages"

[sublime_path, sublime_package_path, sublime_user_path, sublime_installed_packages_path].each do |dir|
    directory dir do
        owner node['current_user']
        recursive true
    end
end

remote_file "#{sublime_installed_packages_path}/Package Control.sublime-package" do
    source 'http://sublime.wbond.net/Package%20Control.sublime-package'
    owner node['current_user']
    action :create_if_missing
end

if node["sublime_use_nodejs"]
    # Linter dependencies
    nodejs_package "jshint"
    nodejs_package "csslint"
end

node["sublime_text_packages"].each do |package|
    applications_sublime_package package["name"] do
        source package["source"]
        branch package["branch"]
        destination File.join(sublime_package_path)
        owner node['current_user']
    end
end

require 'json'
file File.expand_path("Preferences.sublime-settings", File.join(sublime_user_path)) do
    content JSON.generate(node['sublime_text']['preferences'], {:indent => "  ", :object_nl => "\n"})
    owner node['current_user']
    action :create_if_missing
end
