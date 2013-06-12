unless File.exists?("/Applications/ImageAlpha.app")

  remote_file "#{Chef::Config[:file_cache_path]}/ImageAlpha1.2.5.1.tar.bz2" do
    source "http://pngmini.com/ImageAlpha1.2.5.1.tar.bz2"
    owner WS_USER
    checksum "0b1941ed047cac5e03668e04b4da7e58af99afa26af55c54cd1d62b564b11445"
  end

  execute "unzip ImageAlpha" do
    command "tar -xf #{Chef::Config[:file_cache_path]}/ImageAlpha1.2.5.1.tar.bz2 -C #{Chef::Config[:file_cache_path]}/"
    user WS_USER
  end

  execute "copy ImageAlpha to /Applications" do
    command "mv #{Chef::Config[:file_cache_path]}/ImageAlpha.app #{Regexp.escape("/Applications/ImageAlpha.app")}"
    user WS_USER
    group "admin"
  end

  ruby_block "test to see if ImageAlpha.app was installed" do
    block do
      raise "ImageAlpha.app was not installed" unless File.exists?("/Applications/ImageAlpha.app")
    end
  end

end
