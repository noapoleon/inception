include ./srcs/.env

NAME	=	inception
CONFIG	=	./srcs/docker-compose.yml

all: up

up: datadir
	docker compose -p $(NAME) -f $(CONFIG) up -d

down:
	docker compose -p $(NAME) down

datadir:
	@if [ ! -d ${VOL_NGINX} ]; then \
		mkdir -p ${VOL_NGINX}; \
	fi

.PHONY: all up down datadir
