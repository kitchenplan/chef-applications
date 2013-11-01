package "node" do
  action [:install, :upgrade]
end

if platform_family?("debian")
    package "npm" do
        action [:install, :upgrade]
    end
end
