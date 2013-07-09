dmg_package "sourcetree" do
  source  "http://downloads.atlassian.com/software/sourcetree/SourceTree_1.6.2.2.dmg"
  owner node['current_user']
  action :install
end
