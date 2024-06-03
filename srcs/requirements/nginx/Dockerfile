FROM debian:bullseye

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx openssl ca-certificates

# Configure ssl
RUN mkdir -p /etc/nginx/ssl \
	&& openssl req -x509 -nodes -days 365 \
		-subj "/C=FR/ST=Paris/L=Paris/CN=nlegrand.42.fr" \
		-newkey rsa:2048 \
		-keyout /etc/nginx/ssl/selfsigned.key \
		-out /etc/nginx/ssl/selfsigned.crt

# Install config and replace domain name
ARG DOMAIN_NAME
COPY conf/default.conf /etc/nginx/sites-available/default
RUN sed -i "s/\${DOMAIN_NAME}/${DOMAIN_NAME}/g" /etc/nginx/sites-available/default && \
	sed -i '/\s*types\s*{/a\    font/ttf ttf\;' /etc/nginx/mime.types

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
