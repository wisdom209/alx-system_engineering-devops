# Defines a resource for killing a process

exec {'killmenow':
command => '/usr/bin/pkill -f killmenow',
path    => ['/usr/bin'],
onlyif  => '/usr/bin/pgrep killmenow'
}
