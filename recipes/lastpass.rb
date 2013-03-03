dmg_package "lpmacosx" do
  source "https://download.lastpass.com/lpmacosx.dmg"
  volumes_dir "LastPass for Mac OS X"
  action :install
  type "pkg"
  package_id "com.lastpass.lpmacosx"
end
