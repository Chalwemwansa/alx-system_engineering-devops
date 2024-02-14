# a puppet script that is used to fix an issue with an apache server
# this is due to the word phpp in the configuration files instead of php

exec { 'wordpress_fix':
  command => 'sed -i.bak "s/.phpp/.php/g" /var/www/html/wp-settings.php',
  path    => ['/bin', '/usr/bin'],
}
