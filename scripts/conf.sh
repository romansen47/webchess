#!/bin/bash


### Set location and credentials for database

### For external database remove following line
apt-get install -y mysql-server

# Password for DatabaseUser
export DatabaseHost='localhost'

# Name of database
export DatabaseName='WebChess_DB'

# The database user
export DatabaseUser='WebChessUser'

# Password for DatabaseUser
export DatabasePass='12345'


## Configuration of database setup

sed s/WebChessUser/$DatabaseUser/g /tmp/scripts/mysql.sql > /tmp/scripts/mysql.sql.1
sed s/12345/$DatabasePass/g /tmp/scripts/mysql.sql.1 > /tmp/scripts/mysql.sql.2
sed s/WebChess_DB/$DatabaseName/g /tmp/scripts/mysql.sql.2 > /tmp/scripts/mysql.sql.3
sed s/localhost/$DatabaseHost/g /tmp/scripts/mysql.sql.3 > /tmp/scripts/mysql.sql

rm /tmp/scripts/mysql.sql.*


## Configuration of config.php setup

sed s/WebChessUser/$DatabaseUser/g /var/www/config.php > /var/www/config.php.1
sed s/12345/$DatabasePass/g /var/www/config.php.1 > /var/www/config.php.2
sed s/WebChess_DB/$DatabaseName/g /var/www/config.php.2 > /var/www/config.php.3
sed s/localhost/$DatabaseHost/g /var/www/config.php.3 > /var/www/config.php

rm /var/www/config.php.*

service mysql start
mysql -u root < /tmp/scripts/mysql.sql
