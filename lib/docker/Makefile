APP_NAME := ********
ROOT_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

generator:
	@ROOT_PATH=$(ROOT_PATH) APP_NAME=$(APP_NAME) bash $(ROOT_PATH)/etc/setup.sh generator

init: sync_check
	@docker-compose run web rails new . \
		-f -d mysql -T --skip-sprockets --skip-turbolinks --skip-coffee --webpack
	@docker-compose build
	@ROOT_PATH=$(ROOT_PATH) APP_NAME=$(APP_NAME) bash $(ROOT_PATH)/etc/setup.sh db_config
	@docker-compose run --rm web rails db:create
	@docker-compose run --rm web rails db:migrate
	@docker-compose down

deploy: sync_check
	@docker-compose up -d --build
	@sleep 60s
	@docker-compose exec web rails db:create
	@docker-compose exec web rails db:migrate
	@docker-compose down

build:
	@docker-compose up -d --build
	@docker attach "${APP_NAME}_web"

up: sync_check
	@docker-compose up -d
	@docker attach "${APP_NAME}_web"

down:
	@docker-compose down

c:
	@docker-compose exec web rails c

sync_check:
	@APP_NAME=$(APP_NAME) bash $(ROOT_PATH)/etc/setup.sh sync_check
