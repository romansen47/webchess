# Webchess
This is docker running webchess on debian wheezy

# Configuration
If You want to use your own external database, You need to adjust the config.php file. For Raspberry pi3 building from Dockerfile on rpi needed.

# Building
docker build -t webchess .

# Create container
docker run -p 80:80 webchess &

# Access
webchess should be accessible via http://hostname:80/ 

# Plan (maybe)
In an upcoming step the database will be configured in a configuration file will be available in a seperate volume.
