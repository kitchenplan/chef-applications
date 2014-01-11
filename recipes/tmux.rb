include_recipe "applications::default"

package 'tmux' do
    action [:install, :upgrade]
end
