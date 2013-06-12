include_recipe "applications::nodejs"

execute "Install svgo with npm" do
      command "sudo npm install -g svgo"
      user "root"
end

