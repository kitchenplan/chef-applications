include_recipe 'applications::php55'

composer "/usr/local/bin" do
    owner "root"
    action [:install, :update]
end
