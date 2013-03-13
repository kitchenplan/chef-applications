include_recipe "applications::default"

applications_tap "homebrew/dupes"

package "rsync" do
  action [:install, :upgrade]
end
