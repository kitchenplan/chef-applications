include_recipe 'applications::php55'

node['php-apps'].each do |phpapp|
    package phpapp do
        action [:install, :upgrade]
    end
end