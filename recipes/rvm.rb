if platform?("mac_os_x")
    include_recipe applications::gcc42
end

include_recipe rvm::system
