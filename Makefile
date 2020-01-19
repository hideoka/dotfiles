DOTFILE_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

init:
	bash $(DOTFILE_PATH)/install.sh

deploy:
	@make update
	bash $(DOTFILE_PATH)/deploy.sh
	@git config --global core.excludesfile ~/.gitignore_global

update:
	@git pull origin master
