case node["platform_family"]
    when 'mac_os_x'
        include_recipe "applications::homebrewcask"
        homebrew-alternative_cask "google-chrome"
    when 'debian'
      include_recipe "apt"
      apt_repository "chrome" do
          uri "http://dl.google.com/linux/chrome/deb/"
          distribution "stable"
          components ["main"]
          key "https://dl-ssl.google.com/linux/linux_signing_key.pub"
          action :add
      end
      package "google-chrome-stable" do
          action [:install, :upgrade]
      end
end
