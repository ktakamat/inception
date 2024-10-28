#DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

# コンテナをビルドし、バックグラウンドで起動。変更がある場合は再ビルド
up:
# docker compose -f $(DOCKER_COMPOSE_FILE) up -d --build
	docker compose up -d --build

# すべてのコンテナを停止し、ネットワークやボリュームを削除
down:
# docker compose -f $(DOCKER_COMPOSE_FILE) down
	docker compose down

execn:
	docker exec -it nginx bash

execw:
	docker exec -it wp-php bash

execm:
	docker exec -it mariadb bash

re: down up

# コンテナが動作し続ける限りログの出力を継続する
log:
# docker compose -f $(DOCKER_COMPOSE_FILE) logs -f
	docker compose logs -f

ps:
	docker ps

psa:
	docker ps -a

# コンテナ、イメージ、ボリュームを全て削除
clean:
# docker compose -f $(DOCKER_COMPOSE_FILE) down --rmi all -v
	docker compose down --rmi all -v

# 実行中のコンテナを再起動する
restart:
# docker compose -f $(DOCKER_COMPOSE_FILE) restart
	docker compose restart