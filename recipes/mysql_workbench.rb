package "mysql-workbench" do
    action [:install, :upgrade]
    only_if { platform_family?('debian') }
end
