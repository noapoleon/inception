FROM debian:bullseye

# Port documentation
EXPOSE 443

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx openssl ca-certificates

# Configure ssl
RUN mkdir -p /etc/nginx/ssl \
	&& openssl req -x509 -nodes -days 365 \
		-subj "/C=FR/ST=Paris/L=Paris/CN=${DOMAIN_NAME}" \
		-newkey rsa:2048 \
		-keyout /etc/nginx/ssl/selfsigned.key \
		-out /etc/nginx/ssl/selfsigned.crt

# Install config and replace domain name
COPY conf/default.conf /etc/nginx/sites-available/default
COPY tools/setup.sh /setup.sh

ENTRYPOINT ["bash", "/setup.sh"]
