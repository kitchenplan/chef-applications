unless File.exists?("#{Chef::Config[:file_cache_path]}/install_flash_player_osx.dmg")
    remote_file "#{Chef::Config[:file_cache_path]}/install_flash_player_osx.dmg" do
        source "http://fpdownload.macromedia.com/get/flashplayer/pdc/11.6.602.171/install_flash_player_osx.dmg"
        owner node['current_user']
    end
end

execute "attach install_flash_player_osx.dmg" do
    command "hdiutil attach '#{Chef::Config[:file_cache_path]}/install_flash_player_osx.dmg'"
    user node['current_user']
    not_if "pkgutil --packages | grep flash"
end

execute "install Flash" do
    command "installer -pkg \"/Volumes/Flash Player/Install Adobe Flash Player.app/Contents/Resources/Adobe Flash Player.pkg\" -target / -lang en"
    not_if "pkgutil --packages | grep flash"
end

execute "detach install_flash_player_osx.dmg" do
    command "hdiutil detach \"/Volumes/Flash Player\""
    user node['current_user']
    only_if "mount | grep -q 'Flash Player'"
end
