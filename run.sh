#!/bin/bash

chown -R www-data:www-data /var/www/webchess

service mysql start

mysql -u root < /tmp/mysql

/usr/sbin/apache2ctl -D FOREGROUND
