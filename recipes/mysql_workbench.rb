if platform?('mac_os_x')
    dmg_package "MySQLWorkbench" do
        volumes_dir "MySQL Workbench"
        dmg_name "mysql-workbench-gpl-5.2.47-osx-i686"
        source "http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-gpl-5.2.47-osx-i686.dmg/from/http://cdn.mysql.com/"
        action :install
        owner node['current_user']
    end
elsif platform_family?('debian')
    package "mysql-workbench" do
        action [:install, :upgrade]
    end
end
