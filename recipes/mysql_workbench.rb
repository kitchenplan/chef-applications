if platform_family?('debian')
  package "mysql-workbench" do
    action [:install, :upgrade]
  end
end
