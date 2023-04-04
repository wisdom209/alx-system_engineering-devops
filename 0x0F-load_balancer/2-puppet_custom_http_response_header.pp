#setup nginx web server with puppet

$file_content= @(END)
server {
	listen 80 default_server;
	add_header X-Served-By $(hostname);

	root /var/www/html;
	index index.html;

	error_page 404 /404.html;
	location = /404.html{
		internal;
	}

	location /redirect_me {
		return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
	}
}
END

package {'nginx':
ensure   => 'installed',
provider => 'apt'
}

file {'/var/www/html/index.html':
ensure  => file,
content => 'Hello World!
'
}

file {'/var/www/html/404.html':
ensure  => file,
content => "Ceci n'est pas une page
"
}

file {'/etc/nginx/sites-enabled/default':
ensure  => file,
content => $file_content
}

exec {'100 allow nginx':
command => '/usr/sbin/ufw allow "Nginx HTTP"'
}

service {'nginx':
ensure => running,
enable => true
}

