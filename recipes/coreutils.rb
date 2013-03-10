include_recipe "applications::default"

package "coreutils" do
  action :install
end
