include_recipe "applications::default"

applications_tap "homebrew/dupes"

package "apple-gcc42" do
  action [:install, :upgrade]
end
