# Webchess


[WebChess](https://github.com/Thorium/webchess) based on [debian](https://hub.docker.com/_/debian/):wheezy-slim docker container.


## Configuration

If You want to use your own external database, You will need to edit the database configuration file
[conf.sh](scripts/conf.sh). Additionally, if You want to create an external database You can use the [mysql.sql file](scripts/mysql.sql).

You can create the external database running

> ~# mysql -uroot -p'MysqlRootPass' < mysql.sql

Mind that You will need to edit it in order to set the hostname. 

### In detail:

Assume You have a mysql database running on 10.9.9.5 and docker webchess container is running on host on 10.9.9.6. 
Then within mysql.sql You should replace 10.9.9.5 by 10.9.9.6. Alternatively You can replace it by * and provide access from any host.

No local installation of a mysql server is needed in this case.
 

## Building

### Mind that or Raspberry Pie local building from Dockerfile is needed. Alternatively You can use the image privided by *romansen47/webchess:rpi3* tag.

> ~# docker build -t webchess .


## Create container


Create mysql folder

> ~# mkdir mysql

If You are using the internal database You will have access to the database in ./mysql:

> ~# docker run -v $PWD/mysql:/var/lib/mysql -p 80:80 webchess &

If You are using an external database You need to forward the standard mysql port 3306 

> ~# docker run -v $PWD/mysql:/var/lib/mysql -p 80:80 -p 3306:3306 webchess &


## Access

WebChess should be accessible via http://hostname:80/ 

