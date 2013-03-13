include_recipe "applications::default"
include_recipe "applications::bash-completion"


apt_repository "kdeploy" do
  uri "http://ppa.launchpad.net/pdoes/ppa/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "4CBEDD5A"
  deb_src true
  only_if do
    platform?("ubuntu")
  end
end

package "git" do
  action [:install, :upgrade]
end
