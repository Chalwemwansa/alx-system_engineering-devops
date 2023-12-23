# module that helps install flask onto the machine
# the version is 2.1.0 from pip3

exec { 'flask':
  command => 'pip3 install flask==2.1.0',
  path    => ['/usr/bin', '/bin']
}

#install the needed Werkzeug==2.1.1 for compatibility
exec { 'Werkzeug':
  command => 'pip3 install --upgrade Werkzeug==2.1.1',
  path    => ['/usr/bin', '/bin']
}


