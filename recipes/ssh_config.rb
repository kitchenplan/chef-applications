node["ssh"]["hosts"].each do |(host, port)|
    bash "set #{host}" do
        user "root"
        cwd "/etc/"
        code <<-EOH
            echo >> ssh_config
            echo "Host #{host}" >> ssh_config
            echo "    Port #{port}" >> ssh_config
        EOH
        not_if "grep -q #{host} /etc/ssh_config"
    end
end

node["ssh"]["host_aliases"].each do |(host, hostname, port)|
    bash "set #{host}" do
        user "root"
        cwd "/etc/"
        code <<-EOH
            echo >> ssh_config
            echo "Host #{host}" >> ssh_config
            echo "    HostName #{hostname}" >> ssh_config
            echo "    Port #{port}" >> ssh_config
        EOH
        not_if "grep -q #{host} /etc/ssh_config"
    end
end
