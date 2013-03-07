dmg_package "sourcetree" do
  source  "http://downloads.atlassian.com/software/sourcetree/SourceTree_1.5.7.1.dmg"
  owner node['current_user']
  action :install
end
