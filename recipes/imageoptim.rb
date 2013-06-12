unless File.exists?("/Applications/Imageoptim.app")

  remote_file "#{Chef::Config[:file_cache_path]}/ImageOptim.tbz2" do
    source "http://imageoptim.com/ImageOptim.tbz2"
    owner WS_USER
    checksum "0b1941ed047cac5e03668e04b4da7e58af99afa26af55c54cd1d62b564b11445"
  end

  execute "unzip ImageOptim" do
    command "tar -xf #{Chef::Config[:file_cache_path]}/ImageOptim.tbz2 -C #{Chef::Config[:file_cache_path]}/"
    user WS_USER
  end

  execute "copy ImageOptim to /Applications" do
    command "mv #{Chef::Config[:file_cache_path]}/ImageOptim.app #{Regexp.escape("/Applications/ImageOptim.app")}"
    user WS_USER
    group "admin"
  end

  ruby_block "test to see if ImageOptim.app was installed" do
    block do
      raise "ImageOptim.app was not installed" unless File.exists?("/Applications/ImageOptim.app")
    end
  end

end
