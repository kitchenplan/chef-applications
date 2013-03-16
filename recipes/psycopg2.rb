include_recipe "applications::postgresql"

if platform?('mac_os_x')
    easy_install_package "psycopg2"
elsif platform_family?('debian')
    package "python-psycopg2" do
        action [:install, :upgrade]
    end
end
