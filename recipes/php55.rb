include_recipe "applications::default"
include_recipe "applications::postgresql"
include_recipe "applications::mysql"

homebrew_tap "homebrew/dupes"
homebrew_tap "josegonzalez/php"

package "php55" do |variable|
    options "--with-mysql --with-pgsql --with-imap"
end

%w[ php55-apcu php55-http php55-xdebug php55-intl php55-yaml php55-imagick php55-solr php55-twig php55-mcrypt php55-mongo php55-memcached].each do |pkg|
    package pkg do
        action [:install, :upgrade]
    end
end

template "/usr/local/etc/php/5.5/conf.d/99-kunstmaan.ini" do
    source "php90kunstmaan.erb"
    owner node['current_user']
    mode "0644"
end

template "/etc/apache2/other/php.conf" do
  source "apache_php.erb"
  owner node['current_user']
  mode "0755"
end
