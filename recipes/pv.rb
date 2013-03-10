include_recipe "applications::default"

package "pv" do
  action [:install, :upgrade]
end
