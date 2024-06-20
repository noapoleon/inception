#!/usr/bin/env bash

# copy resume files only if not configured
if [ ! -e /var/www/resume/configured ]; then
	cp -r /tmp/resume /var/www/
	touch /var/www/resume/configured
	printf "Copied resume files\n"
else
	printf "Did not copy resume files, already present\n"
fi

sed -i '/\s*types\s*{/a\    font/ttf ttf\;' /etc/nginx/mime.types

# Start nginx server
exec nginx -g "daemon off;"
