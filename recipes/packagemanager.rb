case node["platform_family"]
    when 'mac_os_x'
        directory "/usr/local" do
          owner node['current_user']
          recursive true
        end
        homebrew_go = "#{Chef::Config[:file_cache_path]}/homebrew_go"
        remote_file homebrew_go do
            source "https://raw.github.com/mxcl/homebrew/go/install"
            mode 00755
        end
        execute homebrew_go do
            user node['current_user']
            not_if { File.exist? '/usr/local/bin/brew' }
        end
        execute "update homebrew from github" do
            user node['current_user']
            command "/usr/local/bin/brew update || true"
        end
    when 'debian'
        execute "change to a BE mirror" do
            command "sudo sed 's@us.archive.ubuntu.com@be.archive.ubuntu.com@' -i /etc/apt/sources.list"
            action :run
        end

        include_recipe "apt::default"

        execute 'apt-get-upgrade' do
          command 'apt-get -y upgrade'
        end

    end
