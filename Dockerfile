FROM ruby:2.7-alpine
RUN apk --update add g++ make yarn nodejs postgresql-dev postgresql-client libxslt-dev libxml2-dev tzdata
ARG APP_PATH="/app"
ARG RAILS_ENV
ENV RACK_ENV=$RAILS_ENV

RUN mkdir ${APP_PATH}
WORKDIR ${APP_PATH}
COPY ./Gemfile ./Gemfile.lock ${APP_PATH}/
RUN gem install bundler
RUN bundle install
COPY . ${APP_PATH}
EXPOSE 3000
