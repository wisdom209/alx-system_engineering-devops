# configures a webserver

package {'nginx':
ensure   => 'installed',
provider => 'apt'
}

exec {'100 allow nginx':
command => '/usr/sbin/ufw allow "Nginx HTTP"'
}


file_line { 'addheader':
  ensure => 'present',
  path   => '/etc/nginx/nginx.conf',
  after  => '	gzip on;',
  line   => "	add_header X-Served-By ${hostname};",
}

service {'nginx':
ensure => running,
enable => true
}
