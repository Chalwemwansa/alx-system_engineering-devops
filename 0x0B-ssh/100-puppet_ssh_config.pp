# puppet script that changes the configuraation of the /etc/ssh/ssh_config file

#the ssh path
$ssh_path = '/etc/ssh/ssh_config'

# the commands variable to store the commands in an array
$commands = ["sed -i.bak 's/^#* *PasswordAuthentication *.*/    PasswordAuthentication No/g' ${ssh_path}",
  "sed -i 's/Host \\*/Host \\*\\n    IdentityFile ~\\/\\.ssh\\/school/g' ${ssh_path}"]

#the exec resource to be used to execute the commands
exec { 'ssh_configurations':
  command => $commands.join('; '),
  path    => ['/bin', '/usr/bin'],
}
