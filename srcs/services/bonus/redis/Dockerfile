FROM debian:bullseye

# Port documentation
EXPOSE 6379

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y redis-server

# Copy configs
COPY conf/redis.conf /etc/redis/redis.conf
COPY tools/setup.sh /setup.sh

ENTRYPOINT ["bash", "/setup.sh"]
