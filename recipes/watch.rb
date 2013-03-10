include_recipe "applications::default"

package "watch" do
  action [:install, :upgrade]
end
