name             'applications'
maintainer       'Roderik van der Veer'
maintainer_email 'roderik@vanderveer.be'
license          'Apache 2.0'
description      'Installs and configures mac_osx applications'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
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
