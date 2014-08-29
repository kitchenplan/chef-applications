include_recipe 'applications::php55'

package "phpdocumentor" do
    action [:install, :upgrade]
end
