# Forego: a foreman alternative in Go
# https://github.com/bukowskis/homebrew-bukowskis/blob/master/forego.rb

case node["platform_family"]
    when 'mac_os_x'
        include_recipe "homebrewalt::default"
        homebrewalt_tap "bukowskis/bukowskis"

        package "forego" do
          action [:install, :upgrade]
        end
    when 'debian'
        Chef::Log.debug("This recipe is OSX only")
end
