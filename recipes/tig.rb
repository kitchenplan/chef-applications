include_recipe "applications::default"

package 'tig' do
  action [:install, :upgrade]
end
