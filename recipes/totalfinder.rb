dmg_package "TotalFinder" do
  source "http://downloads.binaryage.com/TotalFinder-1.4.10.dmg"
  action :install
  type "pkg"
  owner node['current_user']
  package_id "com.binaryage.pkg.totalfinder.app"
end
