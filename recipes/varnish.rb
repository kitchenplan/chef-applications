package "varnish" do
    action [:install, :upgrade]
end

service "varnish" do
    supports [:restart]
end

template "/etc/varnish/default.vcl" do
    source "varnish.vcl.erb"
    owner "root"
    group "root"
    mode "0644"
    notifies :restart, "service[varnish]"
end
