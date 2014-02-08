name             'applications'
maintainer       'Roderik van der Veer'
maintainer_email 'roderik@vanderveer.be'
license          'Apache 2.0'
description      'Installs and configures mac_osx applications'
version          '0.0.1'

supports         "mac_os_x"
supports         "ubuntu"

depends          "homebrewalt"

depends          "dmg"
depends          "composer"
depends          "apt"
depends          "rvm"
depends          "rbenv"
depends          "newrelic"
depends          "osxdefaults"

depends          "apache2"
depends          "logrotate"
depends          "percona"
depends          "postgresql"
depends          "php"
depends          "imagemagick"
depends          "nodejs"
depends          "dotfiles"
depends          "sysctl"
depends          "sysfs"
