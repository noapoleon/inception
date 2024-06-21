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
					${VOL_KUMA}

check_env:
	srcs/requirements/tools/check_dotenv.sh srcs/.env

clean: down
	sudo rm -rf ${VOL_HOME}

fclean: clean
	-docker stop $$(docker ps -qa)
	-docker rm $$(docker ps -qa)
	-docker rmi -f $$(docker images -qa)
	-docker volume rm $$(docker volume ls -q)
	-docker network rm $$(docker network ls -q) 2>/dev/null

re: down all

.PHONY: all up down datadir check_env clean fclean re
