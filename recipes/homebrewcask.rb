include_recipe "applications::default"

homebrew_tap "phinze/homebrew-cask" do
    not_if { ::File.directory?("/usr/local/Library/Taps/phinze-cask") }
end

package "brew-cask" do
    action [:install, :upgrade]
end

