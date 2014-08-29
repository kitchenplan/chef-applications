include_recipe 'applications::php55'

package "phpunit" do
    action [:install, :upgrade]
end
