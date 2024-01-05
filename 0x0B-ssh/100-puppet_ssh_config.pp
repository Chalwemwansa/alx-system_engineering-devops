# puppet script that changes the configuraation of the /etc/ssh/ssh_config file

#include the stdlib for file_line
include stdlib

#path to file
$ssh_path = '/etc/ssh/ssh_config'

#use file_line after installation of augeas tools
file_line { 'Turn off passwd auth':
  ensure => present,
  path   => $ssh_path,
  line   => '    PasswordAuthentication No',
  match  => '.*PasswordAuthentication *[yY]?[eE]?[sS]?',
}

file_line { 'Declare identity file':
  ensure => present,
  path   => $ssh_path,
  line   => '    IdentityFile ~/.ssh/school',
  match  => '^[^#] *IdentityFile .*',
}
