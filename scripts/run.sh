#!/bin/bash
 
apt-get update
apt-get install -y  nano git sed \
    apache2 php5-mysql libapache2-mod-php5 mysql-server


## Main section

# Clone webchess, remove demo page, move to /var/www/ and copy new config.php
cd /tmp
git clone https://github.com/Thorium/webchess
rm /var/www/index.html
mv /tmp/webchess/* /var/www/
rm /tmp/webchess -rf

# Configure database and config.php
/bin/bash /tmp/scripts/conf.sh

# Set correct permissions
chown -R www-data:www-data /var/www/

# Apache will be happy :)
echo ServerName 127.0.0.1 >> /etc/apache2/apache2.conf


## Start server
/usr/sbin/apache2ctl -D FOREGROUND
