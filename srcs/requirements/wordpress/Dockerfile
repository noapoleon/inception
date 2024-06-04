FROM debian:bullseye

# Port documentation
EXPOSE 9000

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y
ARG PHP_VER
RUN apt-get install -y	wget \
						php${PHP_VER} \
						php${PHP_VER}-fpm \
						php${PHP_VER}-mysql \
						php${PHP_VER}-redis \
						mariadb-client

# Install wp-cli (command line config tool for wordpress)
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/

# Copy configs
COPY conf/www.conf /etc/php/${PHP_VER}/fpm/pool.d/www.conf
COPY tools/setup.sh /setup.sh

ENTRYPOINT ["bash", "/setup.sh"]

