include_recipe 'applications::php55'

package "unzip"

composer "/usr/local/bin" do
    owner "root"
    action [:install, :update]
end
