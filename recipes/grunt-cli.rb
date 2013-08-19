include_recipe "applications::nodejs"

execute "install grunt-cli with npm" do
  command "npm install -g grunt-cli"
  not_if "npm -g ls | grep grunt-cli"
end
