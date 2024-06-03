FROM debian:bullseye

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y vsftpd ftp
# REMOVE
RUN apt-get install -y net-tools vim

# Copy configs
COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY tools/setup.sh /setup.sh

EXPOSE 20/tcp
EXPOSE 21100-21110

ENTRYPOINT ["bash", "/setup.sh"]
#ENTRYPOINT ["sleep", "infinity"]
