include_recipe "applications::nodejs"

execute "install bower with npm" do
  command "npm install -g bower"
  not_if "npm -g ls | grep bower"
end
