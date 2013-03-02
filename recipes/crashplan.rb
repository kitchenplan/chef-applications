dmg_package "Install CrashPlan" do
  source "http://download.crashplan.com/installs/mac/install/CrashPlan/CrashPlan_3.5.2_Mac.dmg"
  volumes_dir "CrashPlan"
  action :install
  type "pkg"
  package_id "com.crashplan.app.pkg"
end
