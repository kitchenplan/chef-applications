if platform?("mac_os_x")
    include_recipe "applications::homebrewcask"
    applications_cask "dropbox"
elsif platform_family?("debian")
    package "nautilus-dropbox" do
        action [:install, :upgrade]
    end
end
