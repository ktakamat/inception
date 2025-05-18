DOCKER_COMPOSE = docker compose -f ./srcs/docker-compose.yml
up:
	@bash /Users/machi/Desktop/42tokyo/in/srcs/requirements/wordpress/tools/mkdir.sh
	$(DOCKER_COMPOSE) up -d --build
down:
	$(DOCKER_COMPOSE) down

ps:
	$(DOCKER_COMPOSE) ps

pa:
	$(DOCKER_COMPOSE) ps -a

execn:
	docker exec -it nginx bash

execw:
	docker exec -it wp-php bash

execm:
	docker exec -it mariadb bash

rmvol:
	rm -rf database
	rm -rf web

re: down rmvol up

log:
	$(DOCKER_COMPOSE) logs -f

clean:
	$(DOCKER_COMPOSE) down --rmi all -v

restart:
	$(DOCKER_COMPOSE) restart

.PHONY: up down execn execw execm rmvol re log ps psa clean restart
