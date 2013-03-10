include_recipe "applications::default"

package "heroku-toolbelt" do
  action [:install, :upgrade]
end
