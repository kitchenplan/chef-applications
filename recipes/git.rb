include_recipe "applications::default"
include_recipe "applications::bash-completion"

package "git" do
  action :install
end
