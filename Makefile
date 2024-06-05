include ./srcs/.env

CONFIG	=	./srcs/docker-compose.yml

all: up

up: datadir
	docker compose -f $(CONFIG) up --build -d

down:
	docker compose -p ${NAME} down

datadir:
		mkdir -p	${VOL_DB} \
					${VOL_WP} \
					${VOL_ADMINER} \
					${VOL_RESUME} \
					${VOL_REDIS} \
					${VOL_KUMA}

clean: down

fclean: clean

re: down all

.PHONY: all up down clean fclean re datadir
