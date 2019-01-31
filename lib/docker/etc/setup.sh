#!/usr/bin/env bash
set -Ceuo pipefail

COMMAND="$1"

function check_sync() {
  ! $DOCKER_SYNC_CHECK  && return;
  local container_name="$(docker container ls |
    awk -F '  +' '/'"${APP_NAME}-web-sync"'/ NR>1 {print $7}')"

  if [[ -z $container_name ]]; then
    docker-sync start
  fi
}

function docker_compose_command() {
  if $DOCKER_SYNC_CHECK; then
    DOCKER_COMPOSE="docker-compose -f docker-compose.yml -f docker-compose-dev.yml"
  else
    DOCKER_COMPOSE="docker-compose -f docker-compose.yml"
  fi
}

function docker_compose_rails_new() {
  eval "${DOCKER_COMPOSE} run --rm web\
    rails new . -fT -d mysql --webpack\
    --skip-sprockets --skip-turbolinks --skip-coffee "
}

function change_database_config_file() {
  sed -i '' -e "1,30s/password:/password: <%= ENV['MYSQL_ROOT_PASSWORD'] %>/"\
            -e "1,30s/host: localhost/host: db/"\
            $ROOT_PATH/config/database.yml
}

function docker_compose_db_init() {
  eval "${DOCKER_COMPOSE} run --rm web rails db:create"
  eval "${DOCKER_COMPOSE} run --rm web rails db:migrate"
}

function docker_compose_build() {
  eval "${DOCKER_COMPOSE} build"
}

function docker_compose_up() {
  eval "${DOCKER_COMPOSE} up -d"
}

if [[ $COMMAND == 'sync_check' ]]; then
  check_sync
elif [[ $COMMAND == 'generator' ]]; then
  source $ROOT_PATH/etc/generator.sh
elif [[ $COMMAND == 'init' ]]; then
  docker_compose_command
  docker_compose_rails_new
  docker_compose_build
  change_database_config_file
  docker_compose_db_init
elif [[ $COMMAND == 'app_init' ]]; then
  docker_compose_command
  docker_compose_build
  sleep 60
  docker_compose_db_init
elif [[ $COMMAND == 'build' ]]; then
  docker_compose_command
  docker_compose_build
elif [[ $COMMAND == 'up' ]]; then
  docker_compose_command
  docker_compose_up
fi
