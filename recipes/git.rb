include_recipe "applications::default"
include_recipe "applications::bash-completion"

if platform?("ubuntu")
    apt_repository "kdeploy" do
      uri "http://ppa.launchpad.net/pdoes/ppa/ubuntu"
      distribution node['lsb']['codename']
      components ["main"]
      keyserver "keyserver.ubuntu.com"
      key "4CBEDD5A"
      deb_src true
    end
end

package "git" do
  action [:install, :upgrade]
end
