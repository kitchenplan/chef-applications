hosts = Array[
    ["*.cloud.kunstmaan.com",9999],
    ["git.kunstmaan.be",9999]
]

hosts.each do |(host, port)|
    bash "set #{host}" do
        user "root"
        cwd "/etc/ssh/"
        code <<-EOH
            echo >> ssh_config
            echo "Host #{host}" >> ssh_config
            echo "    Port #{port}" >> ssh_config
        EOH
        not_if "grep -q #{host} /etc/ssh/ssh_config"
    end
end

hosts = Array[
    ["acerta","acerta.cloud.kunstmaan.com",9999],
    ["atlas","atlas.cloud.kunstmaan.com",9999],
    ["delta","delta.cloud.kunstmaan.com",9999],
    ["flandersdc","flandersdc.cloud.kunstmaan.com",9999],
    ["proton","proton.cloud.kunstmaan.com",9999],
    ["zenit","zenit.cloud.kunstmaan.com",9999],
]

hosts.each do |(host, hostname, port)|
    bash "set #{host}" do
        user "root"
        cwd "/etc/ssh/"
        code <<-EOH
            echo >> ssh_config
            echo "Host #{host}" >> ssh_config
            echo "    HostName #{hostname}" >> ssh_config
            echo "    Port #{port}" >> ssh_config
        EOH
        not_if "grep -q #{host} /etc/ssh/ssh_config"
    end
end
