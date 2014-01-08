if platform?('mac_os_x')
  include_recipe "applications::homebrewcask"
  homebrew_cask "firefox"
elsif platform_family?('debian')
  %w[firefox firefox-globalmenu firefox-locale-en firefox-locale-nl].each do |pkg|
        package pkg do
            action [:install, :upgrade]
        end
  end
end
