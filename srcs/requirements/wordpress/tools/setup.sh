#!/usr/bin/env bash

# config wordpress with cli
if [[ ! -e /var/www/wordpress/wp-config.php ]]; then
	wp-cli.phar --allow-root config create \
		--dbname=${DB_NAME} \
		--dbuser=${DB_USER} \
		--dbpass=${DB_PASS} \
		--dbhost=mariadb:3306 \
		--path=/var/www/wordpress
fi

if ! wp-cli.phar --allow-root core is-installed --path=/var/www/wordpress; then
	wp-cli.phar --allow-root core install \
		--url=${DOMAIN_NAME} \
		--title=${WP_TITLE} \
		--admin_user=${WP_USER} \
		--admin_password=${WP_PASS} \
		--admin_email=${WP_EMAIL} \
		--skip-email \
		--path=/var/www/wordpress
fi

# create php run dir to prevent error
mkdir -p /run/php

# Replace PID 1
exec /usr/sbin/php-fpm${PHP_VER} -F
