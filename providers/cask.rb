action :install do

    directory "/opt/homebrew-cask/Caskroom" do
        user node['current_user']
        mode 00755
        recursive true
    end

    execute "installing #{new_resource.name} via cask" do
        command "/usr/local/bin/brew cask install --appdir=/Applications #{new_resource.name}"
        user node['current_user']
        not_if "brew cask list | grep #{new_resource.name}"
    end

    new_resource.updated_by_last_action(true)

end
