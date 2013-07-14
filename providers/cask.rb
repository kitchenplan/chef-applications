action :install do
    directory "/opt/homebrew-cask/Caskroom" do
        user node['current_user']
        mode 00755
        recursive true
    end
    
    application = new_resource.name
    execute "installing #{new_resource.name} via cask" do
        command "/usr/local/bin/brew cask install --appdir=/Applications #{new_resource.name}"
        user node['current_user']
    end
    new_resource.updated_by_last_action(true)
end

