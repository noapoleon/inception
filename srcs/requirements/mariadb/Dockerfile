FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/maria.conf.d/50-server.cnf
COPY tools/setup.sh /setup.sh

#ENTRYPOINT ["sleep", "infinity"]
#ENTRYPOINT ["bash"]

# still waits 10 seconds at the end even though PID is 1
# there is however a mysqld process aside from the PID 1 so check that tomorrow
ENTRYPOINT ["/setup.sh"]
