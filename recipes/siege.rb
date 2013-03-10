include_recipe "applications::default"

package "siege" do
  action [:install, :upgrade]
end
