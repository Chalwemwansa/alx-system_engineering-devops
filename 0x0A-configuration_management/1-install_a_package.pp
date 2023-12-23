# module that helps install flask onto the machine
# the version is 2.1.0 from pip3

class { 'flask':
  version => '2.1.0',
}

package { 'python3-flask':
  ensure   => '2.1.0',
  provider => 'pip3'
  require  => Class['flask'],
}

