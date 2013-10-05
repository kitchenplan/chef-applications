if platform?('mac_os_x')
  dmg_package "Java 7 Update 40" do
    source "https://s3-eu-west-1.amazonaws.com/kitchenplan/jdk-7u40-macosx-x64.dmg"
    action :install
    type "pkg"
    package_id "com.oracle.jre"
  end
elsif platform_family?('debian')
  package "openjdk-6-jdk" do
    action [:install, :upgrade]
  end
end
