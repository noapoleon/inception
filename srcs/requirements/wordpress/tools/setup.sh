#!/usr/bin/env bash

#sleep 10s # shouldn't be needed with healthcheck

# config wordpress with cli
if [[ ! -e /var/www/wordpress/wp-config.php ]]; then
	wp-cli.phar config create	--allow-root \
		--dbname=${DB_NAME} \
		--dbuser=${DB_USER} \
		--dbpass=${DB_PASS} \
		--dbhost=mariadb:3306 \
		--path=/var/www/wordpress
fi

# create php run dir to prevent error
mkdir -p /run/php

# Replace PID 1
exec /usr/sbin/php-fpm${PHP_VER} -F
