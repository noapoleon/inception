FROM debian:bullseye

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server

# Copy configs and scripts
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/setup.sh /setup.sh

EXPOSE 3306

ENTRYPOINT ["bash", "/setup.sh"]
