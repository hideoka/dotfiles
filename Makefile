ROOT_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

deploy:
		@make update
		@./etc/deploy.sh

update:
		@git pull origin master

init:
		@./etc/install.sh
