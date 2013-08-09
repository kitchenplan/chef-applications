if platform?('mac_os_x')
  include_recipe "applications::homebrewcask"
  applications_cask "firefox"
elsif platform_family?('debian')
  %w[firefox firefox-globalmenu firefox-gnome-support firefox-locale-en firefox-locale-nl].each do |pkg|
        package pkg do
            action [:install, :upgrade]
        end
  end
end
