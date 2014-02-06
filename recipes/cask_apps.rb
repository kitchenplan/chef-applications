# convenient one-stop shop recipe to install any arbitrary application
# that is supported by brew cask
include_recipe "applications::homebrewcask"

node['brew']['cask_apps'].each do |app|
  homebrew-alternative_cask app
end
