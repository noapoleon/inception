#!/usr/bin/env bash

# Nginx configs modification
sed -i "s/\${DOMAIN_NAME}/${DOMAIN_NAME}/g" /etc/nginx/sites-available/default
sed -i '/\s*types\s*{/a\    font/ttf ttf\;' /etc/nginx/mime.types

# Start nginx server
exec nginx -g "daemon off;"
