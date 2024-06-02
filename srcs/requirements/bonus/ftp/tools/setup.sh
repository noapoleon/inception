#!/usr/bin/env bash

# Create ftp user
# remove -m later
useradd -m -p ${FTP_PASS} ${FTP_USER}
mkdir 

exec vsftpd /etc/vsftpd.conf
