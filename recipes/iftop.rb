include_recipe "applications::default"

package "iftop" do
  action [:install, :upgrade]
end
