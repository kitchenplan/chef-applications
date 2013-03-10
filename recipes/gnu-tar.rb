include_recipe "applications::default"

package "gnu-tar" do
  action [:install, :upgrade]
end

link "/usr/bin/tar" do
    to "/usr/local/bin/gtar"
end
