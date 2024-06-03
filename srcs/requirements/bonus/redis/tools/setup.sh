#!/usr/bin/env bash

sed -i "s/^requirepass example_redis_password$/requirepass ${WP_REDIS_PASS}/g" /etc/redis/redis.conf

exec redis-server /etc/redis/redis.conf
