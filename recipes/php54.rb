include_recipe "homebrewalt::default"
include_recipe "applications::postgresql"
include_recipe "applications::mysql"

homebrewalt_tap "josegonzalez/php"
homebrewalt_tap "homebrew/dupes"

package "php54" do |variable|
    options "--with-mysql --with-pgsql --with-imap"
end

%w[ php54-apc php54-inclued php54-http php54-xdebug php54-intl php54-yaml php54-imagick php54-solr php54-mongo php54-memcached php54-twig php54-mcrypt].each do |pkg|
    package pkg do
        action [:install, :upgrade]
    end
end

template "/usr/local/etc/php/5.4/conf.d/99-kunstmaan.ini" do
    source "php90kunstmaan.erb"
    owner node['current_user']
    mode "0644"
end

template "/etc/apache2/other/php.conf" do
  source "apache_php.erb"
  owner node['current_user']
  mode "0755"
end
