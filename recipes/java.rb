dmg_package "Java 7 Update 15" do
  source "http://javadl.sun.com/webapps/download/AutoDL?BundleId=74775"
  action :install
  type "pkg"
  package_id "com.oracle.jre"
end

dmg_package "JDK 7 Update 13" do
  source "https://s3.amazonaws.com/boxen-downloads/java/jdk-7u13.dmg"
  action :install
  type "pkg"
  package_id "com.oracle.jdk7u13"
end
