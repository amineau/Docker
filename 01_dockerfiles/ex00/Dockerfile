FROM alpine:latest

RUN apk update \
	&& apk add vim \
	&& rm -rf /var/cache/apk/*

ENTRYPOINT ["vim"]
