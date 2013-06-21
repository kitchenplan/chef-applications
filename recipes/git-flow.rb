include_recipe "applications::default"

package "git-flow" do
  action [:install, :upgrade]
end
