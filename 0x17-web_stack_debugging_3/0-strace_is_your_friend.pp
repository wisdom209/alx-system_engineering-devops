# fix the wp server error

exec {'fix the typo error':
command  => 'sed -i "s/phpp/php/g" var/www/html/wp-settings.php',
provider => 'shell'
}
