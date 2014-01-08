include_recipe "applications::packagemanager"
include_recipe "applications::composer"

case node["platform_family"]
    when 'mac_os_x'
        applications_tap "homebrew/dupes"
        applications_tap "homebrew/versions"
        applications_tap "mcuadros/homebrew-hhvm"
    when 'debian'
        apt_repository 'hhvm' do
          uri          'http://dl.hhvm.com/ubuntu'
          distribution node['lsb']['codename']
          components   ['main']
          key          'http://dl.hhvm.com/conf/hhvm.gpg.key'
        end
end

package "hhvm"
dotfiles_bash_it_custom_plugin "hhvm/composerviahhvm.bash"
