FROM ruby:2.3-jessie

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install nodejs -y && \
    gem install rails

ONBUILD COPY . /opt/app/
ONBUILD WORKDIR /opt/app

ONBUILD RUN bundle update
ONBUILD RUN bundle install
ONBUILD RUN rake db:migrate
ONBUILD RUN rake db:seed
