# set up automatic authentication

file {'/etc/ssh/ssh_config':
ensure  => file,
content => 'Host 54.196.49.168
	User ubuntu
	IdentityFile ~/.ssh/school
	PubKeyAuthentication yes
	PasswordAuthenticaton no',
}
