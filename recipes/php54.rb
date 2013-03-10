include_recipe "homebrew::default"
include_recipe "homebrew::apache"

homebrew_tap "josegonzalez/php"
homebrew_tap "homebrew/dupes"

package "php54" do |variable|
    options "--with-mysql --with-pgsql"
end

package "php54-apc"
package "php54-memcached"
package "php54-inclued"
package "php54-http"
package "php54-xdebug"
package "php54-intl"
package "php54-yaml"
package "php54-imagick"
package "php54-solr"
package "php54-twig"
package "php54-mcrypt"

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
