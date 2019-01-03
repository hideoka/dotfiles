function generate_dockerfile() {
  cat <<- EOL > $ROOT_PATH/Dockerfile
FROM ruby:latest

ENV LANG C.UTF-8
ENV APP_ROOT /$APP_NAME

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq &&\\
    apt-get install -y build-essential\\
                       libpq-dev\\
                       nodejs\\
                       yarn

RUN mkdir \$APP_ROOT
WORKDIR \$APP_ROOT

COPY Gemfile \$APP_ROOT/Gemfile
COPY Gemfile.lock \$APP_ROOT/Gemfile.lock
RUN bundle install
COPY . \$APP_ROOT
EOL
  echo 'Generated Dockerfile'
}

function generate_docker-compose() {
  cat <<- EOL > $ROOT_PATH/docker-compose.yml
version: '3.7'
services:
  db:
    image: mysql:latest
    container_name: ${APP_NAME}_db
    env_file:
      - .env.docker
    volumes:
      - ./etc/default_authentication.cnf:/etc/mysql/conf.d/default_authentication.cnf
      - store:/var/lib/mysql
    ports:
      - '3300:3306'
  web:
    build: .
    container_name: ${APP_NAME}_web
    command: /bin/bash -c 'rm -rf tmp/pids/server.pid && bundle exec rails s -p 3000 -b 0.0.0.0'
    env_file:
      - .env.docker
    environment:
      - WEBPACKER_DEV_SERVER_HOST=webpack
    volumes:
      - ${APP_NAME}-web-sync:/${APP_NAME}
    ports:
      - "127.0.0.1:3000:3000"
    tty: true
    stdin_open: true
    depends_on:
      - db
  webpack:
    build: .
    container_name: ${APP_NAME}_webpack
    env_file:
      - .env.docker
    environment:
      - NODE_ENV=development
      - RAILS_ENV=development
      - WEBPACKER_DEV_SERVER_HOST=0.0.0.0
    command: bin/webpack-dev-server
    volumes:
      - ${APP_NAME}-web-sync:/${APP_NAME}
    ports:
      - "3035:3035"

volumes:
  ${APP_NAME}-web-sync:
    external: true
  store:
    driver: local
EOL
  echo 'Generated docker-compose.yml'
}

function generate_mysql_conf() {
  cat <<- EOL > $ROOT_PATH/etc/default_authentication.cnf
[mysqld]
default_authentication_plugin=mysql_native_password
EOL
  echo 'Generated default_authentication.conf'
}

function generate_gemfile() {
  cat <<- EOL > $ROOT_PATH/Gemfile
source 'https://rubygems.org'
gem 'rails', '5.2.2'
EOL
touch $ROOT_PATH/Gemfile.lock
  echo 'Generated Gemfile and Gemfile.lock'
}

function generate_docker-sync() {
  cat <<- EOL > $ROOT_PATH/docker-sync.yml
version: '2'
syncs:
  ${APP_NAME}-web-sync:
    src: '.'
    sync_excludes: ['.git']
EOL
  echo 'Generated docker-sync.yml'
}

function generate_docker_env() {
  cat <<- EOL > $ROOT_PATH/.env.docker
TZ=Asia/Tokyo
EDITOR=vim
MYSQL_USER=root
MYSQL_ROOT_PASSWORD=CentOS7!
EOL
  echo 'Generated .env.docker'

}
function generator_main() {
  if (( $(ls $ROOT_PATH | wc -l) == 2 )); then
    generate_dockerfile
    generate_docker-compose
    generate_mysql_conf
    generate_gemfile
    generate_docker-sync
    generate_docker_env
  else
    echo 'error!! please file initial position'
  fi
}

generator_main
