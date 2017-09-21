FROM golang

RUN apt-get update \
	&& apt-get install -y \
	libpam0g-dev

RUN mkdir -p $GOPATH/src/github.com/gogits
WORKDIR $GOPATH/src/github.com/gogits

RUN git clone --depth=1 -b develop https://github.com/gogits/gogs gogs

WORKDIR $GOPATH/src/github.com/gogits/gogs

RUN go get -u -tags "sqlite pam cert" github.com/gogits/gogs \
	&& go build -tags "sqlite pam cert" \
	&& adduser --disabled-login --gecos 'Gogs' git \
	&& chmod -R a+rw .

WORKDIR /go/src/github.com/gogits/gogs

EXPOSE 22 3000

CMD su git -c "./gogs web"
