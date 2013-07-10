unless File.exists?("/Applications/Imageoptim.app")

  remote_file "#{Chef::Config[:file_cache_path]}/ImageOptim.tbz2" do
    source "http://imageoptim.com/ImageOptim.tbz2"
    owner node['current_user']
  end

  execute "unzip ImageOptim" do
    command "tar -xf #{Chef::Config[:file_cache_path]}/ImageOptim.tbz2 -C #{Chef::Config[:file_cache_path]}/"
    user node['current_user']
  end

  execute "copy ImageOptim to /Applications" do
    command "mv #{Chef::Config[:file_cache_path]}/ImageOptim.app #{Regexp.escape("/Applications/ImageOptim.app")}"
    user node['current_user']
  end

  ruby_block "test to see if ImageOptim.app was installed" do
    block do
      raise "ImageOptim.app was not installed" unless File.exists?("/Applications/ImageOptim.app")
    end
  end

end
