#!/usr/bin/env bash

# Create ftp user
useradd -m ${FTP_USER}
echo ${FTP_USER}:${FTP_PASS} | chpasswd

# Give ownership of wordpress to ftp user
chown -R ${FTP_USER}:${FTP_USER} /var/www/wordpress

# Add user to userlist
echo $FTP_USER > /etc/vsftpd.userlist

# Make dir to avoid error
mkdir -p /var/run/vsftpd/empty

# Start server
echo "FTP started on port 21"
exec vsftpd /etc/vsftpd.conf
