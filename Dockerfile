FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs 
RUN gem install rails -v '5.1.6'


ENV RAILS_ROOT /var/www/rails-api
RUN mkdir -p $RAILS_ROOT 
# Set working directory
WORKDIR $RAILS_ROOT
# COPY . /Gemfile ./

RUN echo $(pwd)
ADD Gemfile Gemfile
RUN echo $(ls -la)
RUN gem install bundler
RUN bundle install

VOLUME ["$INSTALL_PATH/public"]

EXPOSE 3000
RUN echo $(pwd)
CMD "rails server"