case node["platform_family"]
    when 'mac_os_x'
        # Nothing
    when 'debian'
        include_recipe "sysfs::default"

        sysfs 'set io scheduler to noop' do
          variable node['sysfs']['ioscheduler']['disk']
          value 'noop'
          only_if { File.exists?("/sys/#{node['sysfs']['ioscheduler']['disk']}")}
        end
end

include_recipe "sysctl::default"

sysctl 'vm.swappiness' do
    value '0'
end

sysctl 'kernel.shmmax' do
    value '4294967296'
end

sysctl 'fs.file-max' do
    value '262144'
end

sysctl 'kernel.pid_max' do
    value '262144'
end

sysctl 'net.ipv4.tcp_rmem' do
    value '4096 87380 16777216'
end

sysctl 'net.ipv4.tcp_wmem' do
    value '4096 65536 16777216'
end

sysctl 'net.core.rmem_max' do
    value '16777216'
end

sysctl 'net.core.rmem_default' do
    value '16777216'
end

sysctl 'net.core.wmem_max' do
    value '16777216'
end

sysctl 'net.core.wmem_default' do
    value '16777216'
end

sysctl 'net.core.netdev_max_backlog' do
    value '30000'
end

sysctl 'net.ipv4.tcp_window_scaling' do
    value '1'
end

sysctl 'net.core.optmem_max' do
    value '16777216'
end

sysctl 'net.ipv4.ip_local_port_range' do
    value '1024 65535'
end

sysctl 'vm.max_map_count' do
    value '262144'
end
