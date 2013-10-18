include_recipe "applications::default"

lsb = node['lsb'] || {}
codename = lsb['codename'] || ""

apt_repository "tortoisehg" do
  uri "http://ppa.launchpad.net/tortoisehg-ppa/releases/ubuntu"
  distribution codename
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "D5056DDE"
  deb_src true
  only_if { platform?("ubuntu") }
end

package 'mercurial' do
  action [:install, :upgrade]
end
