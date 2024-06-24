# include .env file if it exists
-include ./srcs/.env

NAME	=	inception
CONFIG	=	./srcs/docker-compose.yml

all: up

up: check_env datadir
	docker compose -p ${NAME} -f $(CONFIG) up --build -d

down:
	docker compose -p ${NAME} down

datadir:
		mkdir -p	${VOL_DB} \
					${VOL_WP} \
					${VOL_ADMINER} \
					${VOL_RESUME} \
					${VOL_REDIS} \
					${VOL_KUMA} \
					${VOL_PROMETHEUS} \

check_env:
	srcs/services/tools/check_dotenv.sh srcs/.env

clean: down
	docker compose -p ${NAME} down -v

fclean: clean
	docker compose 

re: down all

.PHONY: all up down clean fclean re datadir check_env
