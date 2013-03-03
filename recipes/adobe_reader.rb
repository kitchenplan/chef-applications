dmg_package "Adobe Reader XI Installer" do
  source "http://ardownload.adobe.com/pub/adobe/reader/mac/11.x/11.0.00/en_US/AdbeRdr11000_en_US.dmg"
  action :install
  volumes_dir "AdbeRdr11000_en_US"
  type "pkg"
  package_id "com.adobe.acrobat.reader.11.reader.app.pkg.en_US"
end
