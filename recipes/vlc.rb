case node["platform_family"]
    when 'mac_os_x'
        include_recipe "applications::homebrewcask"
        homebrew_cask "vlc"
    when 'debian'
        package "vlc" do
            action [:install, :upgrade]
        end
end
