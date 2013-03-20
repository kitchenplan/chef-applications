if platform_family?('debian')
    package "pure-ftpd" do
        action [:install, :upgrade]
    end
    
    execute "create MinUID" do
        cwd "/etc/pure-ftpd/conf"
        user "root"
        command 'echo "0" > MinUID'
        not_if { File.exists?("/etc/pure-ftpd/conf/MinUID") }
    end
end
