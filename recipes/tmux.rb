include_recipe "applications::default"

if platform_family?('mac_os_x')

  package 'tmux' do
    action [:install, :upgrade]
  end

elsif platform_family?('debian')

  package 'tmux' do
    action [:install, :upgrade]
  end

end
