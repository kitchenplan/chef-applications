node['gems'].each do |gem|
  gem_package gem do
    gem_binary '/usr/bin/ruby'
  end
end
