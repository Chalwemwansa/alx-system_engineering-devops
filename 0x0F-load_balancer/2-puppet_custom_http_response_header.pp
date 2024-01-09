# this is a puppet script that configures a server according to some requirements

# this is a puppet script that configures a server according to some requirements

package {'nginx':
  ensure   => installed,
  provider => apt,
}

exec { 'nginx_config':
  command => "sed -i.bak \"s/^[^#]* *server *{/server {\\n\\tadd_header X-Served-By $(hostname);/g\" /etc/nginx/sites-available/default",
  path    => ['/bin', '/usr/bin'],
  unless  => "grep -q 'add_header X-Served-By' /etc/nginx/sites-available/default",
}

service { 'nginx':
  ensure => 'running',
}
