#!/usr/bin/env bash

# Only configure wordpress if installed (looks for wp-config.php)
if ! wp-cli.phar --allow-root --path=/var/www/wordpress core is-installed; then

	# Download main wordpress files
	wp-cli.phar --allow-root --path=/var/www/wordpress core download --version=${WP_VER}

	# Create config file
	wp-cli.phar --allow-root --path=/var/www/wordpress config create \
		--dbname=${DB_NAME} \
		--dbuser=${DB_USER} \
		--dbpass=${DB_PASS} \
		--dbhost=mariadb:3306

	# Install wordpress based on config file
	wp-cli.phar --allow-root --path=/var/www/wordpress core install \
		--url=${DOMAIN_NAME} \
		--title=${WP_TITLE} \
		--admin_user=${WP_USER} \
		--admin_password=${WP_PASS} \
		--admin_email=${WP_EMAIL} \
		--skip-email

	# delete useless plugins
	wp-cli.phar --allow-root --path=/var/www/wordpress plugin uninstall hello --deactivate
	wp-cli.phar --allow-root --path=/var/www/wordpress plugin uninstall akismet --deactivate
	# Install redis plugin
	wp-cli.phar --allow-root --path=/var/www/wordpress plugin install redis-cache --activate
	wp-cli.phar --allow-root --path=/var/www/wordpress plugin update all
	wp-cli.phar --allow-root --path=/var/www/wordpress config set WP_REDIS_HOST redis
	wp-cli.phar --allow-root --path=/var/www/wordpress config set WP_REDIS_PORT 6379
	wp-cli.phar --allow-root --path=/var/www/wordpress config set WP_REDIS_PASSWORD ${WP_REDIS_PASS} &> /dev/null
	wp-cli.phar --allow-root --path=/var/www/wordpress redis enable
fi

# create php run dir to prevent error
mkdir -p /run/php

# Replace PID 1
exec /usr/sbin/php-fpm${PHP_VER} -F
