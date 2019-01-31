APP_NAME := ******
ROOT_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOCKER_SYNC := true

generator:
	@ROOT_PATH=$(ROOT_PATH) APP_NAME=$(APP_NAME) bash $(ROOT_PATH)/etc/setup.sh generator

new_app:
	@ROOT_PATH=$(ROOT_PATH) DOCKER_SYNC_CHECK=false bash $(ROOT_PATH)/etc/setup.sh init
	@make down

init: sync_check
	@ROOT_PATH=$(ROOT_PATH) DOCKER_SYNC_CHECK=$(DOCKER_SYNC) bash $(ROOT_PATH)/etc/setup.sh app_init
	@make down

build:
	@DOCKER_SYNC_CHECK=$(DOCKER_SYNC) bash $(ROOT_PATH)/etc/setup.sh build
	@docker attach "${APP_NAME}_web"

up: sync_check
	@DOCKER_SYNC_CHECK=$(DOCKER_SYNC) bash $(ROOT_PATH)/etc/setup.sh up
	@docker attach "${APP_NAME}_web"

down:
	@docker-compose down

c:
	@docker-compose exec web rails c

sync_check:
	@APP_NAME=$(APP_NAME) DOCKER_SYNC_CHECK=$(DOCKER_SYNC)\
		bash $(ROOT_PATH)/etc/setup.sh sync_check
