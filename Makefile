include ./srcs/.env

NAME	=	inception
CONFIG	=	./srcs/docker-compose.yml

all: up

up: datadir
	docker compose -p $(NAME) -f $(CONFIG) up --build -d

down:
	docker compose -p $(NAME) down

datadir:
	@if [ ! -d ${VOL_DB} ]; then \
		mkdir -p ${VOL_DB}; \
	fi
	@if [ ! -d ${VOL_WP} ]; then \
		mkdir -p ${VOL_WP}; \
	fi

.PHONY: all up down re datadir
