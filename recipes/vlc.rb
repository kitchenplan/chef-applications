case node["platform_family"]
    when 'mac_os_x'
        include_recipe "applications::homebrewcask"
        homebrew-alternative_cask "vlc"
    when 'debian'
        package "vlc" do
            action [:install, :upgrade]
        end
end
