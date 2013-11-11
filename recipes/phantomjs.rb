include_recipe "applications::default"

package 'phantomjs' do
  action [:install, :upgrade]
end
