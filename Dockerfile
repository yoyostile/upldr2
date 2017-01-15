FROM ruby:2.3.1-slim

MAINTAINER Johannes Heck <yoyostile@gmail.com>

RUN apt-get update && apt-get install -qq -y imagemagick libmagickwand-dev curl libxml2 libxml2-dev git build-essential libpq-dev postgresql-client-9.4 --fix-missing --no-install-recommends

ENV INSTALL_PATH /app
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

RUN bundle install --without development test

ADD . /app

RUN bundle exec rake RAILS_ENV=production DATABASE_URL=postgresql://user:pass@127.0.0.1/dbname SECRET_TOKEN=pickasecuretoken assets:precompile

VOLUME ["$INSTALL_PATH/public/uploads"]
EXPOSE 5000

CMD bundle exec passenger start -p 5000 --max-pool-size 20 --min-instances 10
