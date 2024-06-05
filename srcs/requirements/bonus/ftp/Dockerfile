FROM debian:bullseye

# Port Documentation
EXPOSE 20/tcp
EXPOSE 21100-21110

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y vsftpd ftp

# Copy configs
COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY tools/setup.sh /setup.sh

ENTRYPOINT ["bash", "/setup.sh"]
