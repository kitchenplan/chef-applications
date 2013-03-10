include_recipe "applications::default"

package "rsync" do
  action :install
end
