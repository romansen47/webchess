#!/bin/bash

cd /tmp && git clone https://github.com/Thorium/webchess

rm /var/www/index.html

mv /tmp/webchess/* /var/www/

chown -R www-data:www-data /var/www/

service mysql start

mysql -u root < /tmp/mysql

echo ServerName webchess >> /etc/apache2/apache2.conf

/usr/sbin/apache2ctl -D FOREGROUND
