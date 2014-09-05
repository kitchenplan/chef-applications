include_recipe "homebrewalt::default"
include_recipe "applications::mysql"

homebrewalt_tap "homebrew/dupes"
homebrewalt_tap "homebrew/homebrew-php"

package "php56" do |variable|
    options "--with-mysql --with-apache"
end

%w[ php56-apcu php56-http php56-xdebug php56-mongo php56-yaml php56-imagick php56-twig php56-mcrypt].each do |pkg|
    package pkg do
        action [:install, :upgrade]
    end
end

template "/usr/local/etc/php/5.6/conf.d/99-extras.ini" do
    source "phpini.erb"
    owner node['current_user']
    mode "0644"
end

template "/etc/apache2/other/php.conf" do
  source "apache_php.erb"
  owner node['current_user']
  mode "0755"
  variables(
    :version => 56
  )
end

include_recipe "applications::php-apps"