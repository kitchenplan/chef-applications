name             'applications'
maintainer       'Roderik van der Veer'
maintainer_email 'roderik@vanderveer.be'
license          'Apache 2.0'
description      'Installs and configures mac_osx applications'
version          '0.0.1'

supports         "mac_os_x"
supports         "debian"
supports         "ubuntu"

depends          "dmg"
depends          "composer"
depends          "apt"
depends          "rvm"
depends          "apache2"
depends          "percona"
depends          "newrelic"
depends          "osxdefaults"
depends          "logrotate"
depends          "php"
