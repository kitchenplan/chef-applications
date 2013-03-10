directory Chef::Config[:file_cache_path] do
  owner "root"
  group value_for_platform(
                            "mac_os_x" => { "default" => "admin" },
                            "default" => "root"
                          )
  mode 0777
  action :create
  recursive true
end
