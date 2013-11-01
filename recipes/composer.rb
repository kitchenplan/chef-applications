if platform?("mac_os_x")
  composer "/usr/local/bin" do
    owner "root" # optional
    action [:install, :update]
  end
elsif platform_family?("debian")
  composer "/usr/bin" do
    owner "root" # optional
    action [:install, :update]
  end
end
