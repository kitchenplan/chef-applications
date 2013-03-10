include_recipe "homebrew::default"

if platform_family?('mac_os_x')

    package "htop-osx" do
      action :install
    end

else

    package "htop" do
      action :install
    end

end
