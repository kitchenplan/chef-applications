if platform?("mac_os_x")
  include_recipe "applications::homebrewcask"
  homebrew_cask "vlc"
elsif platform_family?("debian")
    package "vlc" do
        action [:install, :upgrade]
    end
end
