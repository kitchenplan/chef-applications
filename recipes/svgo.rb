case node["platform_family"]
    when 'mac_os_x'
      if !File.exists?("/Applications/svgo-gui.app")

          include_recipe "nodejs::default"
          nodejs_package "svgo"

          git "/tmp/svgo-gui" do
              repository "git://github.com/svg/svgo-gui.git"
              reference "master"
              action :sync
              user "root"
          end

          execute "Compile svgo-gui" do
                command "sudo make osx"
                user "root"
                cwd "/tmp/svgo-gui"
          end

          execute "Move svgo-gui to /Applications" do
                command "sudo mv osx/svgo-gui.app/ /Applications/"
                user "root"
                cwd "/tmp/svgo-gui"
          end
      end
    when 'debian'
        Chef::Log.debug("This recipe is OSX only")
end
