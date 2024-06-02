FROM debian:bullseye

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y

# Install config and replace domain name
COPY conf/ /tmp/resume/
COPY tools/setup.sh /setup.sh

ENTRYPOINT ["bash", "/setup.sh"]
