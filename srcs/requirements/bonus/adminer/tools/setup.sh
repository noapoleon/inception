#!/usr/bin/env bash

# create php run dir to prevent error
mkdir -p /run/php

# Replace PID 1
exec /usr/sbin/php-fpm${PHP_VER} -F
