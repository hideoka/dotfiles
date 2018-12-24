DOTFILE_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

deploy:
	@make update
	bash $(DOTFILE_PATH)/etc/deploy.sh

update:
	@git pull origin master

init:
	bash $(DOTFILE_PATH)/etc/install.sh
