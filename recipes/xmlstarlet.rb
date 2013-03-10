include_recipe "applications::default"

package "xmlstarlet" do
  action [:install, :upgrade]
end
