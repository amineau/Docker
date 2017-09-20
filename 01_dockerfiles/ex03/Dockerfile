FROM debian:latest

ENV VERSION 1.9
ENV OS linux
ENV ARCH amd64

ENV GOPATH /home/git/local
ENV GOROOT /home/git/local/go

RUN apt-get update \
	&& apt-get install -y \
	git \
	wget \
	tar \
	gcc \
	libpam0g-dev \
	sudo

RUN adduser --disabled-login --gecos 'Gogs' git \
	&& adduser git sudo

RUN mkdir -p $GOPATH/src/github.com/gogits \
	&& wget https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz \
	&& tar -C /home/git/local -xzf go$VERSION.$OS-$ARCH.tar.gz \
	&& mkdir /data

ENV PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

WORKDIR $GOPATH/src/github.com/gogits

RUN git clone --depth=1 -b develop https://github.com/gogits/gogs gogs 

WORKDIR $GOPATH/src/github.com/gogits/gogs

RUN go get -u -tags "sqlite pam cert" github.com/gogits/gogs \
	&& go build -tags "sqlite pam cert"

USER git
VOLUME ["/data"]
EXPOSE 22 3000

#CMD ["./gogs", "web"]
