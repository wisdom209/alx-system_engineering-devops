#setup nginx web server with puppet

package {'nginx':
ensure   => 'installed',
provider => 'apt'
}

file {'/var/www/html/index.html':
ensure  => file,
content => 'Hello World!
'
}

exec {'100 allow nginx':
command => '/usr/sbin/ufw allow "Nginx HTTP"'
}

file_line { 'redirect':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'root /var/www/html;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

service {'nginx':
ensure => running,
enable => true
}

