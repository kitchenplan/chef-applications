if platform?('mac_os_x')
    dmg_package 'Adium' do
        source 'http://netcologne.dl.sourceforge.net/project/adium/Adium_1.5.6.dmg"
        action :install
        volumes_dir "Adium_1.5.6"
    end
end
