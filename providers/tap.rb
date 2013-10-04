action :tap do
    tap_dir = new_resource.name.gsub('/', '-')
    execute "tapping #{new_resource.name}" do
        user node['current_user']
        command "/usr/local/bin/brew tap #{new_resource.name}"
        not_if { ::File.directory?("/usr/local/Library/Taps/#{tap_dir}") }
    end
    new_resource.updated_by_last_action(true)
end

action :untap do
    tap_dir = new_resource.name.gsub('/', '-')
    execute "untapping #{new_resource.name}" do
      user node['current_user']
      command "/usr/local/bin/brew untap #{new_resource.name}"
      only_if { ::File.directory?("/usr/local/Library/Taps/#{tap_dir}") }
    end
    new_resource.updated_by_last_action(true)
end
