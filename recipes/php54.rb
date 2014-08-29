include_recipe "homebrewalt::default"
include_recipe "applications::mysql"

homebrewalt_tap "homebrew/dupes"
homebrewalt_tap "homebrew/homebrew-php"

package "php54" do |variable|
    options "--with-mysql --with-imap"
end

%w[php54-apc php54-inclued php54-http php54-xdebug php54-yaml php54-imagick php54-solr php54-mongo php54-memcached php54-twig php54-mcrypt].each do |pkg|
    package pkg do
        action [:install, :upgrade]
    end
end

template "/usr/local/etc/php/5.4/conf.d/99-extras.ini" do
    source "phpini.erb"
    owner node['current_user']
    mode "0644"
end

template "/etc/apache2/other/php.conf" do
  source "apache_php.erb"
  owner node['current_user']
  mode "0755"
  variables(
    :version => 54
  )
end
