# this is a puppet script that configures a server according to some requirements

# this is a puppet script that configures a server according to some requirements

package {'nginx':
  ensure   => installed,
  provider => apt,
}
$command = "sed -i.bak \"s/^[^#]* *server *{/server {\\n\\tadd_header X-Served-By $(hostname);/g\" /etc/nginx/sites-available/default"

exec { 'nginx_config':
  command => $command,
  path    => ['/bin', '/usr/bin'],
  unless  => "grep -q 'add_header X-Served-By' /etc/nginx/sites-available/default",
}

service { 'nginx':
  ensure => 'running',
}
