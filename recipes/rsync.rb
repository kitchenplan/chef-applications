include_recipe "homebrew::default"

package "rsync" do
  action :install
end
