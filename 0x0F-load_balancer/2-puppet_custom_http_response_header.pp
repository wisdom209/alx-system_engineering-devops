# configures a webserver

package {'nginx':
ensure   => 'installed',
provider => 'apt'
}

exec {'100 allow nginx':
command => '/usr/sbin/ufw allow "Nginx HTTP"'
}

exec {'add header':
command => '/usr/bin/sed -i "s/http {/http {\n\tadd_header X-Served-By $(hostname);/" /etc/nginx/nginx.conf',
}

service {'nginx':
ensure  => running,
enable  => true,
restart => 'usr/sbin/service nginx restart'
}
