# Using Debian Wheezy with PHP 5.4
FROM debian:wheezy

# Update system and install lamp server
RUN apt-get update && apt-get install -y nano git apache2 mysql-server php5-mysql libapache2-mod-php5

# Add configuration files
ADD mysql /tmp/mysql
ADD run.sh /usr/local/bin/run.sh
ADD config.php /tmp/config.php

# Run main process
CMD /bin/bash /usr/local/bin/run.sh


