# Webchess

[WebChess](https://github.com/Thorium/webchess) based on debian wheezy-slim docker container.


## Configuration

If You want to use your own external database, You need to adjust the scripts/conf.sh file.
You can use the scripts/mysql.sql script in order to create a user and database 
corresponding to credentials provided in this file. 
configure an external database running

> ~# mysql -uroot -p'MysqlRootPass' < mysql.sql

No local installation of a mysql server is needed in this case.
 
For Raspberry Pie building from Dockerfile on rpi needed.



## Building

> ~# docker build -t webchess .


## Create container

If You are using an external database You need to forward the standard mysql port 3306 

> ~# docker run -p 80:80 -p 3306:3306 webchess &

If You are using the internal database You will propably want to have access to internal /var/lib/mysql directory.
No forwarding of port 3306 needed.

> ~# docker run -v /PathToDir:/var/lib/mysql -p 80:80 webchess &


## Access

WebChess should be accessible via http://hostname:80/ 

