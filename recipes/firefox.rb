case node["platform_family"]
    when 'mac_os_x'
        include_recipe "applications::homebrewcask"
        homebrew_cask "firefox"
    when 'debian'
    %w[firefox firefox-globalmenu firefox-locale-en firefox-locale-nl].each do |pkg|
        package pkg do
            action [:install, :upgrade]
        end
    end
end
