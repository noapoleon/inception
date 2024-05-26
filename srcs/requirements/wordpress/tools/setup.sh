#!/usr/bin/env bash

sleep 10s

# config wordpress with cli
wp-cli.phar config create	--allow-root \
					--dbname=${DB_NAME} \
					--dbuser=${DB_USER} \
					--dbpass=${DB_PASS} \
					--dbhost=mariadb:3306 \
					--path=/var/www/wordpress

# create php run dir to prevent error
mkdir -p /run/php

# Replace PID 1
exec /usr/sbin/php-fpm${PHP_VER} -F
