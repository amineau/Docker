FROM ruby

ENV TARGET /opt/app

RUN apt-get update \
	&& apt-get install -y nodejs \
	&& gem install rails

ONBUILD COPY app/ $TARGET

ONBUILD WORKDIR $TARGET

ONBUILD RUN bundle install \
	&& rails db:migrate \
	&& rails db:setup

ONBUILD EXPOSE 3000
