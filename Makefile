include ./srcs/.env

NAME	=	inception
CONFIG	=	./srcs/docker-compose.yml

all: up

up: datadir
	docker compose -p $(NAME) -f $(CONFIG) up --build -d

down:
	docker compose -p $(NAME) down

datadir:
		mkdir -p	${VOL_DB} \
					${VOL_WP} \
					${VOL_ADMINER} \
					${VOL_RESUME} \
					${VOL_REDIS}

.PHONY: all up down re datadir
