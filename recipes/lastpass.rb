dmg_package "LastPass for Mac OS X" do
  source "https://download.lastpass.com/lpmacosx.dmg"
  volumes_dir "lpmacosx"
  action :install
  type "pkg"
#  package_id "org.wireshark.Wireshark.pkg"
end
