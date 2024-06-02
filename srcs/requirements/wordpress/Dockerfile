FROM debian:bullseye

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y
ARG PHP_VER WP_VER WPCLI_VER
RUN apt-get install -y	wget \
						php${PHP_VER} \
						php${PHP_VER}-fpm \
						php${PHP_VER}-mysql \
						mariadb-client

# WAIT we are reinstalling wordpress everytime... maybe put this in install script?
# Manually install wordpress
RUN wget https://wordpress.org/wordpress-${WP_VER}.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-${WP_VER}.tar.gz && rm wordpress-${WP_VER}.tar.gz
RUN chown -R root:root /var/www/wordpress
# Install wp-cli (command line config tool for wordpress)
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/

# Copy configs
COPY conf/www.conf /etc/php/${PHP_VER}/fpm/pool.d/www.conf
COPY tools/setup.sh /setup.sh

EXPOSE 9000

ENTRYPOINT ["bash", "/setup.sh"]

