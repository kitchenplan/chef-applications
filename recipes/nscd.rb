service "nscd" do
    supports [:restart]
end

package "nscd" do
    action [:install, :upgrade]
    notifies :restart, "service[nscd]"
end
