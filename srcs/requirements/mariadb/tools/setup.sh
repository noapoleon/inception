#!/usr/bin/env bash

# start mysql
service mariadb start

# Create db
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# Create db user
mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Give all privileges to new user
mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Give a password to root user
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# Update changes with flush
mariadb -e "FLUSH PRIVILEGES;"

# restart mysql
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

# Replace PID 1
exec mysqld
#exec mysqld_safe
#exec mysqld_safe --pid-file=/run/mysqld/mysqld.pid --socket=/run/mysqld/mysqld.socket
