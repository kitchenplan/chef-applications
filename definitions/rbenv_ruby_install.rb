define :rbenv_ruby_install do
  ruby_version = params[:version] || params[:name]
  options = params[:options] || {}

  include_recipe "homebrew::rbenv"

  install_cmd = "#{options[:env]} rbenv install #{ruby_version} #{options[:command_line_options]}"

  execute "installing #{ruby_version} with RBENV: #{install_cmd}" do
    only_if params[:only_if] if params[:only_if]
    not_if params[:not_if] || "test -e #{node['etc']['passwd'][node['current_user']]['dir']}/versions/#{ruby_version}/bin/ruby"
    command install_cmd
    user params[:user] || node['current_user']
    ignore_failure true # rbenv install appears to return 1 on completion for an unknown reason at this time
  end

  execute "check #{ruby_version}" do
    command "rbenv versions | grep #{ruby_version}"
    user params[:user] || node['current_user']
  end
end
