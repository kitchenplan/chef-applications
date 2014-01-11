case node["platform_family"]
    when 'mac_os_x'
        include_recipe "applications::homebrewcask"
        homebrew_cask "dropbox"
    when 'debian'
        package "nautilus-dropbox" do
            action [:install, :upgrade]
        end
end
