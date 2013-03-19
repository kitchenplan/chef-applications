include_recipe "applications::mysql"

#This is need on ubuntu, the version of distribute must be up-to-date to install mysql-python
easy_install_package "distribute" do
    options "-U"
    action :install
end

easy_install_package "MySQL-python"
