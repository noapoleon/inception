FROM debian:bullseye

# Version args from docker compose
ARG PHP_VER WP_VER WPCLI_VER

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y	wget \
						php${PHP_VER} \
						php${PHP_VER}-fpm \
						php${PHP_VER}-mysql \
						mariadb-client

# Manually install wordpress
RUN wget https://wordpress.org/wordpress-${WP_VER}.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-${WP_VER}.tar.gz && rm wordpress-${WP_VER}.tar.gz
RUN chown -R root:root /var/www/wordpress
# Install wp-cli (command line config tool for wordpress)
RUN wget https://github.com/wp-cli/wp-cli/releases/download/v2.10.0/wp-cli-2.10.0.phar
RUN chmod +x wp-cli-2.10.0.phar && mv wp-cli-2.10.0.phar /usr/local/bin/wp-cli.phar

# Copy configs
COPY conf/www.conf /etc/php/${PHP_VER}/fpm/pool.d/www.conf
COPY tools/setup.sh /setup.sh

EXPOSE 9000

ENTRYPOINT ["bash", "/setup.sh"]

