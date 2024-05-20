include ./srcs/.env

NAME	=	inception
CONFIG	=	./srcs/docker-compose.yml

all: up

up: datadir
	docker compose -p $(NAME) -f $(CONFIG) up -d

down:
	docker compose -p $(NAME) down

datadir:
	@if [ ! -d ${VOL_MARIADB} ]; then \
		mkdir -p ${VOL_MARIADB}; \
	fi
	@if [ ! -d ${VOL_WORDPRESS} ]; then \
		mkdir -p ${VOL_WORDPRESS}; \
	fi

.PHONY: all up down datadir
