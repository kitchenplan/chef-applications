include_recipe "applications::xquartz"

dmg_package "Wireshark 1.10.0 Intel 64" do
  source "http://wiresharkdownloads.riverbed.com/wireshark/osx/Wireshark%201.10.0%20Intel%2064.dmg"
  volumes_dir "Wireshark"
  action :install
  type "pkg"
  package_id "org.wireshark.Wireshark.pkg"
end
