include_recipe "applications::php55"

execute "install skyab" do
    command "curl -sS https://raw.github.com/Kunstmaan/skylab/master/installer | php && mv skylab.phar /usr/local/bin/skylab"
    not_if { ::File.exists?("/usr/local/bin/skylab") }
end
