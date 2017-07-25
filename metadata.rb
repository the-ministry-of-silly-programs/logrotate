name 'cop_logrotate'
maintainer 'Copious Inc.'
maintainer_email 'engineering@copiousinc.com'
license 'MIT'
description 'Installs and configures logrotate.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.0'

source_url 'https://github.com/copious-cookbooks/logrotate'
issues_url 'https://github.com/copious-cookbooks/logrotate/issues'

supports 'ubuntu', '>= 14.04'
supports 'debian', '>= 6'
supports 'rhel', '>= 6'
supports 'centos', '>= 6'
