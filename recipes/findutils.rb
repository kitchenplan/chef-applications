include_recipe "applications::default"

package "findutils" do
  action [:install, :upgrade]
end
