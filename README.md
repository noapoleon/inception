# 42 Docker project
Configure 3 docker containers in a network and make them communicate:
- [x] Nginx
- [x] Wordpress + php-fpm
- [x] MariaDB

Bonuses:
- [x] Redis
- [x] FTP Server
- [x] Static Website (Resume)
- [x] Adminer
- [x] Custom Service (Uptime-kuma)

Issues:
- [ ] 10 seconds close time for ftp
- [x] check if uptime-kuma monitor works when nginx killed
- [x] Copy .env file somewhere or make a script to detect it has everything
- [x] check version obselete warning
- [ ] docker bind volumes can't be deleted without root, check if can be fixed

> [!CAUTION]
> Remove dummy resume and put good one instead before submitting
