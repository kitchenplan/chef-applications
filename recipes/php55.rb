include_recipe "homebrewalt::default"
include_recipe "applications::mysql"

homebrewalt_tap "homebrew/dupes"
homebrewalt_tap "homebrew/homebrew-php"

package "php55" do |variable|
    options "--with-mysql --with-apache"
end

%w[php55-apcu php55-http php55-xdebug php55-yaml php55-imagick php55-twig php55-mcrypt].each do |pkg|
    package pkg do
        action [:install, :upgrade]
    end
end

template "/usr/local/etc/php/5.5/conf.d/99-extras.ini" do
    source "phpini.erb"
    owner node['current_user']
    mode "0644"
end

template "/etc/apache2/other/php.conf" do
  source "apache_php.erb"
  owner node['current_user']
  mode "0755"
  variables(
    :version => 55
  )
end

include_recipe "applications::php-apps"