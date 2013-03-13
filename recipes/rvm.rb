if platform?("mac_os_x")
    include_recipe applications::gcc42
end

%w[ openssl libxml2 libxslt libksba sqlite ].each do |pkg|
    package pkg do
        action [:install, :upgrade]
    end
end

include_recipe "rvm::system"
