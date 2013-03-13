include_recipe "applications::default"

if platform?("mac_os_x")
    include_recipe "applications::gcc42"
	packages = %w[ openssl libxml2 libxslt libksba sqlite  ]
elsif platform_family?("debian")
    packages = %w[ openssl libxml2 libxslt1.1 libksba8 sqlite ]
end

packages.each do |pkg|
    package pkg do
        action [:install, :upgrade]
    end
end

include_recipe "rvm::system"
