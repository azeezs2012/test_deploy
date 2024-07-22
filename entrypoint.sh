#!/bin/bash

# Define variables
NGINX_CONF_DIR="/opt/bitnami/nginx/conf/vhosts"
NGINX_CONF="$NGINX_CONF_DIR/pr-1-redirect.conf"

# Create the Nginx configuration directory if it doesn't exist
sudo mkdir -p $NGINX_CONF_DIR

# Create the Nginx configuration file
cat <<EOL | sudo tee $NGINX_CONF
server {
    listen 8081;
    server_name localhost;

    location / {
        return 301 http://pr-1.rapidload.live\$request_uri;
    }
}
EOL

# Test the Nginx configuration
sudo /opt/bitnami/nginx/sbin/nginx -t

# Reload Nginx to apply the changes
sudo /opt/bitnami/ctlscript.sh restart nginx
