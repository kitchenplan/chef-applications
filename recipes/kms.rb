include_recipe 'dotfiles::bash_it'

# Getting the kms sources

git "/opt/kms" do
  repository "https://github.com/Kunstmaan/kms.git"
  reference "master"
  action :checkout
  user "root"
end

# Add to the bash_profile settings
dotfiles_bash_it_custom_plugin "kms" do
    name "bash_it/custom/kms.bash"
    cookbook "dotfiles"
end
