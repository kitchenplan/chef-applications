include_recipe "applications::nodejs"

execute "Install svgo with npm" do
      command "npm install -g svgo"
end

