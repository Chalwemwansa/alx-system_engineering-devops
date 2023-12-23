# module that helps install flask onto the machine
# the version is 2.1.0 from pip3

package { 'flask':
  ensure   => '2.1.0',
  name     => 'python3-flask',
  provider => 'pip3',
}

