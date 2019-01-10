# webchess
docker running webchess on debian wheezy

# Building
If You want to use your own external database, You need to adjust the config.php file.
docker build -t webchess .

# Create container
docker run -p 80:80 webchess &

# Plan (maybe)
In an upcoming step the database will be configured in a configuration file will be available in a seperate volume.
