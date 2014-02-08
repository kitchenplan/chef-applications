include_recipe "homebrewalt::default"

if platform_family?("mac_os_x")
   homebrewalt_tap "homebrew/dupes"
end

package "rsync" do
  action [:install, :upgrade]
end
