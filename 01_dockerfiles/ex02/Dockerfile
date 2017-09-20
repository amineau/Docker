FROM ruby:latest

ENV APP ex02
ENV TARGET /opt/app

RUN gem install rails \
	&& rails new $APP

WORKDIR /$APP

RUN sed -i "s/# gem 'therubyracer'/gem 'therubyracer'/g" Gemfile \
	&& bundle install
	 
RUN mkdir -p $TARGET \
	&& cp -r /$APP $TARGET
