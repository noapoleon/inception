FROM debian:bullseye

# Port documentation
EXPOSE 3001

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt install -y curl git python3 python3-pip

# Install correct versions of nodejs and npm using nvm
SHELL ["/bin/bash", "-c"]
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 20.4.0
RUN mkdir -p "$NVM_DIR"; \
    curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh" | bash; \
    source $NVM_DIR/nvm.sh; \
    nvm install $NODE_VERSION --latest-npm
RUN ln -sf $NVM_DIR/versions/node/v$NODE_VERSION/bin/node /usr/bin/node; \
	ln -sf $NVM_DIR/versions/node/v$NODE_VERSION/bin/npm /usr/bin/npm;

# Clone uptime-kuma and install dependencies
RUN git clone https://github.com/louislam/uptime-kuma.git /app
WORKDIR /app
RUN rpm install dayjs; npm run setup
# Install api for config script
RUN pip install uptime-kuma-api

# Install config and replace domain name
COPY tools/config-uptime-kuma.py /
COPY tools/setup.sh /

ENTRYPOINT ["bash", "/setup.sh"]
#ENTRYPOINT ["sleep", "infinity"]
