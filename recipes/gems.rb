#gem_install_dir = `gem env gemdir | tr -d "\n"`
gem_install_dir = '/Library/Ruby/Gems/2.0.0'
node['gems'].each do |gem|
  gem_package gem do
    gem_binary("/usr/bin/gem")
    options("--install-dir '#{gem_install_dir}' --bindir '/usr/bin'")
  end
end
