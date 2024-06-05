FROM debian:bullseye

# Port documentation
EXPOSE 9000

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y	wget \
						php7.4 \
						php7.4-fpm \
						php7.4-mysql \
						php7.4-redis \
						mariadb-client

# Install wp-cli (command line config tool for wordpress)
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/

# Copy configs
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/setup.sh /setup.sh

ENTRYPOINT ["bash", "/setup.sh"]

