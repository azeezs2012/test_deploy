#!/bin/bash

# Calculate the dynamic server name based on port difference
DIFF=$((TARGET_PORT - HOST_PORT))
SERVER_NAME="pr-${DIFF}.rapidload.live"

# Replace placeholders in the Nginx template configuration
envsubst '${SERVER_NAME} ${TARGET_PORT}' < /etc/nginx/nginx-template.conf > /etc/nginx/conf.d/default.conf

# Start Nginx
nginx -g 'daemon off;'
