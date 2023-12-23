# module that helps install flask onto the machine
# the version is 2.1.0 from pip3

exec { 'flask':
  command => 'pip3 install Flask==2.1.0',
  path    => ['/usr/bin', '/bin']
}

