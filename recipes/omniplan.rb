dmg_package "OmniPlan" do
    accept_eula true
    source "http://www.omnigroup.com/download/latest/omniplan"
    action :install
    owner node['current_user']
end
