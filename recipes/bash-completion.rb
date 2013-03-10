include_recipe "applications::default"

package "bash-completion" do
  action [:install, :upgrade]
end
