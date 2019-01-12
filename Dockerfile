# Using Debian Wheezy with PHP 5.4
FROM debian:wheezy-slim

# Add configuration files
ADD scripts /tmp/scripts

# Add volume mysql
# Volume mysql /var/lib/

# Run main process
CMD /bin/bash /tmp/scripts/run.sh


