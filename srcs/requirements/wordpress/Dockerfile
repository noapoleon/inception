FROM debian:bullseye

# Version args from docker compose
ARG PHP_VER
ARG WP_VER

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y wget	php${PHP_VER} \
							php${PHP_VER}-fpm \
							php${PHP_VER}-mysql \
							mariadb-client

# Manually install wordpress
RUN wget https://wordpress.org/wordpress-${WP_VER}.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-${WP_VER}.tar.gz && rm wordpress-${WP_VER}.tar.gz
RUN chown -R root:root /var/www/wordpress

# Copy configs and scripts
COPY conf/www.conf /etc/php/${PHP_VER}/pool.d/www.conf
COPY tools/setup.sh /setup.sh

# remove
ENTRYPOINT ["bash", "/setup.sh"]
