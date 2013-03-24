service "ondemand" do
    action :start
end

execute "Configure the scheduler" do
    user "root"
    command 'sed -i "s/\([^/]\)ondemand/\1performace/g" /etc/init.d/ondemand'
    notifies :start, "service[ondemand]"
end
