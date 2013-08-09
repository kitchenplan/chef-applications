if platform?("mac_os_x")
  include_recipe "applications::homebrewcask"
  applications_cask "vlc"
elsif platform_family?("debian")
    package "vlc" do
        action [:install, :upgrade]
    end
end
