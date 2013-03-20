if platform_family?('debian')
    package "pure-ftpd" do
        action [:install, :upgrade]
    end
    
    service "pure-ftpd" do
        supports [:restart]
    end
    
    execute "create MinUID" do
        cwd "/etc/pure-ftpd/conf"
        user "root"
        command 'echo "0" > MinUID'
        not_if { File.exists?("/etc/pure-ftpd/conf/MinUID") }
        notifies :restart, "service[pure-ftpd]"
    end
end
