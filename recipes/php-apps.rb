node['php-apps'].each do |phpapp|
    package phpapp do
        action [:install, :upgrade]
    end
end