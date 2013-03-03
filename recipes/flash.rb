dmg_package "Install Adobe Flash Player" do
  source "http://fpdownload.macromedia.com/get/flashplayer/pdc/11.6.602.171/install_flash_player_osx.dmg"
  volumes_dir "Flash Player"
  action :install
  type "pkg"
  package_id "com.adobe.pkg.FlashPlayer"
end
