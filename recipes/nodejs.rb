package "node" do
  action [:install, :upgrade]
end

package "npm" do
    action [:install, :upgrade]
    only_if platform_family?("debian")
end
