template "/etc/sysctl.d/50-tuning.conf" do
    source "sysctltuning.erb"
    owner "root"
    group "root"
    mode "0644"
end

execute "configure kernel parameters" do
    user "root"
    command "sysctl -p"
end

template "/etc/security/limits.conf" do
    source "security.limits.conf.erb"
    owner "root"
    group "root"
    mode "0644"
end
