FROM debian:bullseye

# Port documentation
EXPOSE 80

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx

# Install config and replace domain name
COPY conf/default.conf /etc/nginx/sites-available/default
COPY conf/resume/ /tmp/resume/
COPY tools/setup.sh /setup.sh

ENTRYPOINT ["bash", "/setup.sh"]
