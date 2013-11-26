name             'rainbox'
maintainer       'Ziga Vidic'
maintainer_email 'zigomir@gmail.com'
license          'MIT'
description      'Installs/Configures rainbow box'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

# TODO specify branch or commit here for golang 1.1.2
depends 'postgresql'
depends 'database'
depends 'golang'
