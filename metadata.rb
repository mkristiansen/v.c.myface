name             'myface'
maintainer       'Morten Kristiansen'
maintainer_email 'morten.kristiansen@gmail.com'
license          'All rights reserved'
description      'Installs/Configures myface'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.0'

depends 'mysql', '~> 4.0.0'
depends 'apache2', '~> 1.8.0'
depends 'database', '~> 1.6.0'
