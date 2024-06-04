FROM debian:bullseye

# Port documentation
EXPOSE 3001

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt install -y git nodejs npm python3 python3-pip

# Clone uptime-kuma and install dependencies
RUN git clone https://github.com/louislam/uptime-kuma.git /app
WORKDIR /app
RUN npm run setup
# Install api for config script
RUN pip install uptime-kuma-api

# Install config and replace domain name
COPY tools/config-uptime-kuma.py /
COPY tools/setup.sh /

ENTRYPOINT ["bash", "/setup.sh"]
