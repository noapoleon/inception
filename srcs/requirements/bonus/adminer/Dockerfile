FROM debian:bullseye

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y	wget \
						php7.4 \
						php7.4-fpm \
						php7.4-mysql \
						mariadb-client

# Install adminer file
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
RUN mkdir -p /var/www/adminer && \
	mv adminer-4.8.1.php /var/www/adminer/adminer.php

# Copy configs
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/setup.sh /setup.sh

# Port documentation
EXPOSE 9000

ENTRYPOINT ["bash", "/setup.sh"]
