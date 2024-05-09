FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
# ca-certificates
RUN apt-get install -y nginx openssl ca-certificates
RUN mkdir -p /etc/nginx/ssl \
	&& openssl req -x509 -nodes -days 365 \
		-subj "/C=FR/ST=Paris/L=Paris/CN=nlegrand.42.fr" \
		-newkey rsa:2048 \
		-keyout /etc/nginx/ssl/selfsigned.key \
		-out /etc/nginx/ssl/selfsigned.crt

COPY conf/default.conf /etc/nginx/sites-available/default

ENTRYPOINT ["nginx", "-g", "daemon off;"]
