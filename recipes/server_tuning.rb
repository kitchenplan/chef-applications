template "/etc/sysctl.d/50-tuning.conf" do
    source "sysctl.d.50-tuning.conf.erb"
    owner "root"
    group "root"
    mode "0644"
end
    
execute "configure kernel parameters" do
    user "root"
    command "sysctl -p"
end
   
execute "set user limits" do
    user "root"
    command "ulimit -n 100000"
end   
 
template "/etc/security/limits.conf" do
    source "security.limits.conf.erb"
    owner "root"
    group "root"
    mode "0644"
end
