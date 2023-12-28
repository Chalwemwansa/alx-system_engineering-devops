# puppet script that changes the configuraation of the /etc/ssh/ssh_config file

augeas { 'ssh_client_configuration':
  context => '/etc/ssh/ssh_config',
  changes => [
    "set identityFile ~/.ssh/school",
    "set PasswordAuthentication no",
  ],
}
