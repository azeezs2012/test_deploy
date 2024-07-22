#!/bin/bash

# Define variables
NGINX_CONF="/etc/nginx/sites-available/pr-1-redirect"
NGINX_CONF_LINK="/etc/nginx/sites-enabled/pr-1-redirect"

# Create the Nginx configuration file
cat <<EOL > $NGINX_CONF
server {
    listen 8081;
    server_name localhost;

    location / {
        return 301 http://pr-1.rapidload.live\$request_uri;
    }
}
EOL

# Enable the configuration by creating a symbolic link to sites-enabled
ln -s $NGINX_CONF $NGINX_CONF_LINK

# Test the Nginx configuration
nginx -t

# Reload Nginx to apply the changes
systemctl reload nginx
