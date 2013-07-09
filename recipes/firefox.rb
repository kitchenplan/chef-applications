if platform?('mac_os_x')
  dmg_package "Firefox" do
    source "https://download.mozilla.org/?product=firefox-22.0&os=osx&lang=en-US"
    action :install
    owner node['current_user']
  end
elsif platform_family?('debian')
  %w[firefox firefox-globalmenu firefox-gnome-support firefox-locale-en firefox-locale-nl].each do |pkg|
        package pkg do
            action [:install, :upgrade]
        end
  end
end
