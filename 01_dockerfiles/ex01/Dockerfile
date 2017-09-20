FROM debian:latest

ENV TS_VERSION 3.0.13.8
ENV TS_DIR /opt/teamspeak/

RUN apt-get update \
	&& apt-get install -y \
	wget \
	tar \
	&& rm -rf /var/lib/apt/lists/*


WORKDIR /tmp

RUN wget -O /tmp/teamspeak3-server.tar.gz http://dl.4players.de/ts/releases/$TS_VERSION/teamspeak3-server_linux-amd64-$TS_VERSION.tar.gz \
	&& tar -xf teamspeak3-server.tar.gz \
	&& mv teamspeak3-server_linux-amd64 $TS_DIR \
	&& adduser --disabled-password --no-create-home --gecos "" teamspeak \
	&& chown teamspeak:teamspeak $TS_DIR \
	&& chmod 0770 $TS_DIR

EXPOSE 9987/udp 30033 10011

USER teamspeak

WORKDIR $TS_DIR

ENV PATH="/opt/teamspeak/:$PATH"

ENTRYPOINT ["ts3server_minimal_runscript.sh", "createinifile=1"]
