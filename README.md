# Webchess


[WebChess](https://github.com/Thorium/webchess) based on [debian](https://hub.docker.com/_/debian/):wheezy-slim docker container.


## Configuration

If You want to use your own external database, You will need to edit the database configuration file
[conf.sh](scripts/conf.sh). Additionally, if You want to create an external database You can use the [mysql.sql file](scripts/mysql.sql).

After having edited *mysql.sql* You can create the external database running

> ~# mysql -uroot -p'MysqlRootPass' < mysql.sql

No local installation of a mysql server is needed in this case.
 
Mind that or Raspberry Pie local building from Dockerfile is needed. Alternatively You can use the image privided by *romansen47/webchess:rpi3* tag.


## Building

> ~# docker build -t webchess .


## Create container


Create mysql folder

> ~# mkdir mysql

If You are using an external database You need to forward the standard mysql port 3306 

> ~# docker run -v $PWD/mysql:/var/lib/mysql -p 80:80 -p 3306:3306 webchess &

No forwarding of port 3306 needed.

> ~# docker run -v $PWD/mysql:/var/lib/mysql -p 80:80 webchess &


## Access

WebChess should be accessible via http://hostname:80/ 

