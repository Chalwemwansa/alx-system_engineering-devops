# a puppet script that configures an ubuntu server
# requirements;
# listen on port 80, a redirection when redirect_me is visited

# the path variable
$nginx_path = '/etc/nginx/sites-available/default'

# the commands in a commands variable
$commands = ['apt -y update && apt -y install nginx',
  "sed -i.bak 's/listen [0-9]\\{1,\\}/listen 80/g' ${nginx_path}",
  "sed -i 's/listen \\[::\\]:[0-9]\\{1,\\}/listen \\[::\\]:80/g' ${nginx_path}",
  "sed -i 's/^[^#]*location \\/ {/\\tlocation = \\/ {\\n\\t\\treturn 200 \"Hello World!\\\\n\";/g' ${nginx_path}",
  "sed -i 's/^[^#]*server {/server {\\n\\tlocation \\/redirect_me {\\n\\t\\treturn 301 http:\\/\\/localhost;\\n\\t}/g' ${nginx_path}",
  'service nginx restart']

exec { 'nginx_configuration':
  command => $commands.join('; '),
  path    => ['/bin', '/usr/bin'],
  timeout => 600,
}
