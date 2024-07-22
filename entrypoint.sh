#!/bin/bash

# Define variables
APACHE_CONF_DIR="/opt/bitnami/apache2/conf/vhosts"
APACHE_CONF="$APACHE_CONF_DIR/pr-1-redirect.conf"

# Create the Apache configuration directory if it doesn't exist
sudo mkdir -p $APACHE_CONF_DIR

# Create the Apache configuration file
cat <<EOL | sudo tee $APACHE_CONF
<VirtualHost *:8081>
    ServerName localhost

    <Location />
        Redirect permanent / http://pr-1.rapidload.live
    </Location>
</VirtualHost>
EOL

# Test the Apache configuration
sudo /opt/bitnami/apache2/bin/httpd -t

# Reload Apache to apply the changes
sudo /opt/bitnami/ctlscript.sh restart apache
