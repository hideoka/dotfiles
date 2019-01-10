DOTFILE_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

init:
	@DOTFILE_PATH=$(DOTFILE_PATH) bash $(DOTFILE_PATH)/etc/install.sh

deploy:
	@make update
	@DOTFILE_PATH=$(DOTFILE_PATH) bash $(DOTFILE_PATH)/etc/deploy.sh

update:
	@git pull origin master
