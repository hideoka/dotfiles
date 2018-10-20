FROM ruby:latest

ENV LANG C.UTF-8
ENV APP_ROOT /app

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq &&\
    apt-get install -y\
    build-essential\
    libpq-dev\
    nodejs\
    yarn

RUN mkdir $APP_ROOT

WORKDIR $APP_ROOT
COPY Gemfile ${APP_ROOT}/Gemfile
COPY Gemfile.lock ${APP_ROOT}/Gemfile.lock
RUN bundle install
COPY . $APP_ROOT
