if platform?('mac_os_x')
    execute "install sass" do
        command "sudo gem install sass --no-ri --no-rdoc"
        not_if { File.exist?("/usr/bin/sass") }
    end

    execute "create sass symlink" do
        command "sudo ln -s `sudo -u #{node['current_user']} gem env gemdir`/bin/sass /usr/bin/sass"
        not_if { File.exist?("/usr/bin/sass") }
    end
end
