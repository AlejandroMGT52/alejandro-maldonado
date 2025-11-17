APP_NAME=pgmaldonado
STACK_FILE=stack.yml

build:
	docker build -t pgmaldonado:1.0.1 .

deploy:
	docker stack deploy --with-registry-auth -c stack.yml doraemon

rm:
	docker stack rm doraemon

ps:
	docker service ls

restart:
	make rm
	sleep 5
	make build
	make deploy