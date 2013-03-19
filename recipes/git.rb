include_recipe "applications::default"
include_recipe "applications::bash-completion"

#Hack for making this work with mac os x
lsb = node['lsb'] || {}
codename = lsb['codename'] || ""

apt_repository "kdeploy" do
  uri "http://ppa.launchpad.net/pdoes/ppa/ubuntu"
  distribution codename
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "4CBEDD5A"
  deb_src true
  only_if { platform?("ubuntu") }
end

package "git" do
  action [:install, :upgrade]
end
