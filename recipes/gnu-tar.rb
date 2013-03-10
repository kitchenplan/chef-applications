include_recipe "applications::default"

package "gnu-tar" do
  action :install
end

link "/usr/bin/tar" do
    to "/usr/local/bin/gtar"
end
