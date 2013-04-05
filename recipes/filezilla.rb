if platform?('mac_os_x')
    unless File.exists?("/Applications/FileZilla.app")
        remote_file "#{Chef::Config['file_cache_path']}/FileZilla_3.6.0.2_i686-apple-darwin9.app.tar.bz2" do
            source "http://surfnet.dl.sourceforge.net/project/filezilla/FileZilla_Client/3.6.0.2/FileZilla_3.6.0.2_i686-apple-darwin9.app.tar.bz2"
        end

        execute "tar -xjf #{Chef::Config['file_cache_path']}/FileZilla_3.6.0.2_i686-apple-darwin9.app.tar.bz2" do
            cwd "/Applications"
        end
    end
end
