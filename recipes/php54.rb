include_recipe "applications::default"
include_recipe "applications::apache"

applications_tap "josegonzalez/php"
applications_tap "homebrew/dupes"

package "php54" do |variable|
    options "--with-mysql --with-pgsql"
end

package "php54-apc" do
  action [:install, :upgrade]
end
package "php54-memcached" do
  action [:install, :upgrade]
end
package "php54-inclued" do
  action [:install, :upgrade]
end
package "php54-http" do
  action [:install, :upgrade]
end
package "php54-xdebug" do
  action [:install, :upgrade]
end
package "php54-intl" do
  action [:install, :upgrade]
end
package "php54-yaml" do
  action [:install, :upgrade]
end
package "php54-imagick" do
  action [:install, :upgrade]
end
package "php54-solr" do
  action [:install, :upgrade]
end
package "php54-twig" do
  action [:install, :upgrade]
end
package "php54-mcrypt" do
  action [:install, :upgrade]
end

template "/usr/local/etc/php/5.4/conf.d/99-kunstmaan.ini" do
    source "phpconfig.erb"
    owner node['current_user']
    mode "0644"
end

template "/etc/apache2/other/php.conf" do
  source "apache_php.erb"
  owner node['current_user']
  mode "0755"
end
