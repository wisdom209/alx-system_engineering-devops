# configures a webserver

package {'nginx':
ensure   => 'installed',
provider => 'apt'
}

exec {'100 allow nginx':
command => '/usr/sbin/ufw allow "Nginx HTTP"'
}

exec {'add header':
command => sed -i "s/http {/http {\n\tadd_header X-Served-By $(hostname);/" /etc/nginx/nginx.conf,
path    => ['usr/bin/sed']
}

service {'nginx':
ensure => running,
enable => true
}
