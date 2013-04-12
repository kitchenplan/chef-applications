include_recipe "applications::default"

package "drush" do
  action [:install, :upgrade]
end
