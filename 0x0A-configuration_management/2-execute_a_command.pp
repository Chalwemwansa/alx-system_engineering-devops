# kills the process killmenow using this pkill puppet script

exec { 'pkill':
  command => 'pkill -f "killmenow"',
  path    => ['/usr/bin', '/bin'],
}
