include_recipe "applications::default"

if platform_family?("mac_os_x")
   homebrew_tap "homebrew/dupes"
end

package "rsync" do
  action [:install, :upgrade]
end
