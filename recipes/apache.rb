include_recipe "applications::default"

if platform?('mac_os_x')
    template "/etc/apache2/other/kdeploy.conf" do
      source "apache_kdeploy_osx.erb"
      owner "root"
      group value_for_platform(
                                "mac_os_x" => { "default" => "admin" },
                                "default" => "root"
                              )
      mode "0755"
      variables(
        :user => node['current_user']
      )
    end

    template "/etc/apache2/httpd.conf" do
        source "httpd.conf.erb"
        owner "root"
        mode "0755"
        notifies :restart, "service[apache2]"
    end

elsif platform_family?('debian')
    include_recipe "apache2::default"
    template "/etc/apache2/conf.d/kdeploy.conf" do
        source "apache_kdeploy_debian.erb"
        owner "root"
        mode "0755"
        notifies :restart, "service[apache2]"
    end
end

%w{/etc/apache2/conf/projects.d /etc/apache2/logs /opt/nowebsite}.each do |pkg|
  directory pkg do
      owner "root"
      group value_for_platform(
                            "mac_os_x" => { "default" => "admin" },
                            "default" => "root"
                          )
      mode 0777
      action :create
      recursive true
  end
end

%w{/etc/apache2/conf/projects.d/namevirtualhosts /etc/apache2/workers.properties}.each do |pkg|
  file pkg do
    owner "root"
    group value_for_platform(
                            "mac_os_x" => { "default" => "admin" },
                            "default" => "root"
                          )
    mode 0777
    action :touch
  end
end

if platform_family?('debian')

    %w[ apache2 apache2-mpm-worker apache2-threaded-dev libapache2-mod-rpaf libapache2-mod-php5 libapache2-mod-jk ].each do |pkg|
        package pkg do
            action [:install, :upgrade]
        end
    end

    #Settings for mod_jk
    template "/etc/apache2/mods-enabled/jk.conf" do
        source "apache_jk.conf.erb"
        owner "root"
        mode "0755"
        notifies :restart, "service[apache2]"
    end

    template "/etc/apache2/conf/projects.d/namevirtualhosts" do
        source "apache_namevirtualhosts.erb"
        owner "root"
        mode "0644"
        notifies :restart, "service[apache2]"
    end

    template "/etc/apache2/apache2.conf" do
        source "apache2.conf.erb"
        owner "root"
        mode "0644"
        notifies :restart, "service[apache2]"
    end

    apache_module "actions"
    apache_module "rewrite"
    apache_module "ssl"

    bash "default" do
        user "root"
        code <<-EOH
            a2dissite 000-default
        EOH
        only_if File.exists?("/etc/apache2/sites-enabled/000-default")
    end

end
