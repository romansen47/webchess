# webchess
docker running webchess on debian wheezy

# Building
If You want to use your own external database, You need to adjust the config.php and the mysql file, accordingly.
docker build -t webchess .

# Create container
docker run -p 80:80 webchess &


