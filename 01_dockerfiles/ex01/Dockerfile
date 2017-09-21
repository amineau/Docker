FROM debian:latest

ENV TS_VERSION 3.0.13.8
ENV TS_DIR /opt/teamspeak/
ENV OS linux
ENV ARCH amd64

RUN apt-get update \
	&& apt-get install -y \
	wget \
	tar \
	bzip2 \
	&& rm -rf /var/lib/apt/lists/*


WORKDIR /tmp
RUN echo "_$OS_$ARCH-$TS_VERSION.tar.bz2"
RUN echo "_linux_"
RUN wget http://dl.4players.de/ts/releases/$TS_VERSION/teamspeak3-server_linux_$ARCH-$TS_VERSION.tar.bz2 \
	&& tar -xjf teamspeak3-server_linux_$ARCH-$TS_VERSION.tar.bz2 \
	&& mv teamspeak3-server_linux_$ARCH $TS_DIR \
	&& adduser --disabled-password --no-create-home --gecos "" teamspeak \
	&& chown teamspeak:teamspeak $TS_DIR \
	&& chmod 0770 $TS_DIR

EXPOSE 9987/udp 30033 10011

USER teamspeak

WORKDIR $TS_DIR

ENV PATH="/opt/teamspeak/:$PATH"

ENTRYPOINT ["ts3server_minimal_runscript.sh", "createinifile=1"]
