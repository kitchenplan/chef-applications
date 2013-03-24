include_recipe "applications::mysql"

#This is needed on ubuntu, the version of distribute must be up-to-date to use easy_install_package
execute "Update distribute" do
    user "root"
    command "easy_install -U distribute"
end

easy_install_package "MySQL-python"
