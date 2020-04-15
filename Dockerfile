# Dockerfile - Development environment
FROM ruby:2.7-alpine
MAINTAINER Ghost

ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

#nokogiri
RUN apk add --no-cache --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev

RUN bundle config build.nokogiri --use-system-libraries

# nodejs
RUN apk add --update --no-cache nodejs yarn ruby-nokogiri

# rails
RUN gem install bundler
COPY drkiq/Gemfile Gemfile
WORKDIR /opt/app/drkiq
RUN bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3 --no-document

#RUN chown -R user:user /opt/app
USER $USER_ID
VOLUME ["$INSTALL_PATH/public"]
CMD bundle exec unicorn -c config/unicorn.rb
#CMD bundle exec puma -C config/puma.rb
