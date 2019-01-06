#!/usr/bin/env bash
set -Ceuo pipefail

COMMAND="$1"

function check_sync() {
  local container_name="$(docker container ls |
    awk -F '  +' '/'"${APP_NAME}-web-sync"'/ NR>1 {print $7}')"

  if [[ -z $container_name ]]; then
    docker-sync start
  fi
}

function change_database_config_file() {
  cat $ROOT_PATH/config/database.yml |
    (rm $ROOT_PATH/config/database.yml;\
      sed -e "1,30s/password:/password: <%= ENV['MYSQL_ROOT_PASSWORD'] %>/"\
          -e "1,30s/host: localhost/host: db/" > $ROOT_PATH/config/database.yml)
}

if [[ $COMMAND == 'sync_check' ]]; then
  if $DOCKER_SYNC; then
    check_sync
  fi
elif [[ $COMMAND == 'generator' ]]; then
  source $ROOT_PATH/etc/generator.sh
elif [[ $COMMAND == 'db_config' ]]; then
  change_database_config_file
fi
