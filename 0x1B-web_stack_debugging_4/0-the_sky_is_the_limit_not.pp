# Allow to handle more open files

exec {'change default limits':
  provider => shell,
  command  => 'sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
  before   => Exec['restart'],
}

exec {'restart nginx':
  provider => shell,
  command  => 'sudo service nginx restart',
}
