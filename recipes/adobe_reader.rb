case node["platform_family"]
    when 'mac_os_x'
        dmg_package "Adobe Reader XI Installer" do
          source "http://ardownload.adobe.com/pub/adobe/reader/mac/11.x/11.0.04/en_US/AdbeRdr11004_en_US.dmg"
          action :install
          volumes_dir "AdbeRdr11004_en_US"
          type "pkg"
          package_id "com.adobe.acrobat.reader.11004.reader.app.pkg.en_US"
        end
    when 'debian'
        Chef::Log.debug("This recipe is OSX only")
end
