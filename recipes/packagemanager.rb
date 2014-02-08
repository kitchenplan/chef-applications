case node["platform_family"]
    when 'mac_os_x'
        directory "/usr/local" do
          owner node['current_user']
          recursive true
        end
        include_recipe "homebrewalt::default"
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
