# this is a puppet script that configures a server according to some requirements

# this is a puppet script that configures a server according to some requirements

package {'nginx':
  ensure   => installed,
  provider => apt,
}

$command = ["sed -i.bak \"s/^[^#]* *server *{/server {\\n\\tadd_header X-Served-By $(hostname);/g\" /etc/nginx/sites-available/default",
  "sed -i.bak 's/listen [0-9]\{1,\}/listen 80/g' /etc/nginx/sites-available/default",
  "sed -i 's/listen \[::\]:[0-9]\{1,\}/ listen \[::\]:80/g' /etc/nginx/sites-available/default",
  "sed -i 's/^[^\(#.*\)]location \/ {/\tlocation = \/ {\n\t\treturn 200 "Hello World!\\n";/g' /etc/nginx/sites-available/default"]

exec { 'nginx_config':
  command => $command.join('; '),
  path    => ['/bin', '/usr/bin'],
  unless  => "grep -q 'add_header X-Served-By' /etc/nginx/sites-available/default",
}

service { 'nginx':
  ensure => 'running',
}
