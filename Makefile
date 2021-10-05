DOTFILE_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

init:
	bash $(DOTFILE_PATH)/install.sh
	bash $(DOTFILE_PATH)/deploy.sh

deploy:
	bash $(DOTFILE_PATH)/deploy.sh

update:
	@git pull origin master
