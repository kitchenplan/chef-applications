include_recipe "applications::default"
include_recipe "applications::bash-completion"
include_recipe "applications::git"

package "hub" do
  action [:install, :upgrade]
end
