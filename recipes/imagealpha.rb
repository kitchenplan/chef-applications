unless File.exists?("/Applications/ImageAlpha.app")

  remote_file "#{Chef::Config[:file_cache_path]}/ImageAlpha1.2.5.1.tar.bz2" do
    source "http://pngmini.com/ImageAlpha1.2.5.1.tar.bz2"
    owner node['current_user']
  end

  execute "unzip ImageAlpha" do
    command "tar -xf #{Chef::Config[:file_cache_path]}/ImageAlpha1.2.5.1.tar.bz2 -C #{Chef::Config[:file_cache_path]}/"
    user node['current_user']
  end

  execute "copy ImageAlpha to /Applications" do
    command "mv #{Chef::Config[:file_cache_path]}/ImageAlpha.app #{Regexp.escape("/Applications/ImageAlpha.app")}"
    user node['current_user']
  end

  ruby_block "test to see if ImageAlpha.app was installed" do
    block do
      raise "ImageAlpha.app was not installed" unless File.exists?("/Applications/ImageAlpha.app")
    end
  end

end
