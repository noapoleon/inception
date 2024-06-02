#!/usr/bin/env bash

# Only copy resume files if non existant in volume
if [ ! -e /var/www/resume/index.html ]; then
	cp /tmp/resume/index.html /var/www/resume/
fi
#if [ ! -e /var/www/resume/style.css ]; then
#	cp /tmp/resume/style.css /var/www/resume/
#fi

exit 0
