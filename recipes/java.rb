case node["platform_family"]
    when 'mac_os_x'
        dmg_package "JDK 7 Update 40" do
            source "https://s3-eu-west-1.amazonaws.com/kitchenplan/jdk-7u40-macosx-x64.dmg"
            action :install
            type "pkg"
            package_id "com.oracle.jdk7u40"
        end
    when 'debian'
        package "openjdk-6-jdk" do
            action [:install, :upgrade]
        end
end
