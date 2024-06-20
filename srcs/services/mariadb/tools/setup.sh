#!/usr/bin/env bash

# start mysql
service mariadb start

# Create db
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

# Create db user
mariadb -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASS}';"

# Give all privileges to new user
mariadb -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASS}';"

# Give a password to root user
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';"

# Update changes with flush
mariadb -e "FLUSH PRIVILEGES;"

# restart mysql
mysqladmin -u root -p$DB_ROOT_PASS shutdown

# Replace PID 1
exec mysqld
