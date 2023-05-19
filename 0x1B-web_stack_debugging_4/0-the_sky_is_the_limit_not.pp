# Resolve failed requests due to default limit of open files

exec {'change limits':
  provider => shell,
  command  => 'sudo echo "ULIMIT =\" -n 4096\"" > /etc/default/nginx',
  before   => Exec['restart'],
}

exec {'restart nginx':
  provider => shell,
  command  => 'sudo service nginx restart'
}
