include_recipe "applications::mysql"

if platform?('mac_os_x')
    easy_install_package "MySQL-python"
elsif platform_family?('debian')
    package "python-mysqldb" do
        action [:install, :upgrade]
    end
end
