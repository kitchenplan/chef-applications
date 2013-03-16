include_recipe "applications::xquartz"

dmg_package "Wireshark 1.8.6 Intel 64" do
  source "http://wiresharkdownloads.riverbed.com/wireshark/osx/Wireshark%201.8.6%20Intel%2064.dmg"
  volumes_dir "Wireshark"
  action :install
  type "pkg"
  package_id "org.wireshark.Wireshark.pkg"
end
