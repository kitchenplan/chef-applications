%w[nl_BE fr_BE en_GB es_ES nl_BE.utf8 fr_BE.utf8 en_GB.utf8 es_ES.utf8].each do |l|
    execute "install locale #{l}" do
        user "root"
        command "locale-gen #{l}"
        not_if "locale -a | grep #{l}"
    end
end
