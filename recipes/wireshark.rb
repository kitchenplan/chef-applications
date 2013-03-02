dmg_package "Wireshark 1.8.5 Intel 64" do
  source "http://wiresharkdownloads.riverbed.com/wireshark/osx/Wireshark%201.8.5%20Intel%2064.dmg"
  action :install
  type "pkg"
  package_id "org.wireshark.Wireshark.pkg"
end
