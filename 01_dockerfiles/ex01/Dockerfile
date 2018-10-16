FROM debian:latest

RUN useradd ts3admin

ENV TS3SERVER_LICENSE=accept \
    TS3SERVER_VERSION=3.4.0

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    bzip2 \
    && apt-get autoremove -y

WORKDIR /home/ts3

ADD http://dl.4players.de/ts/releases/${TS3SERVER_VERSION}/teamspeak3-server_linux_amd64-${TS3SERVER_VERSION}.tar.bz2 ./
RUN tar xvjf teamspeak3-server_linux_amd64-${TS3SERVER_VERSION}.tar.bz2 && \
    rm -rf teamspeak3-server_linux_amd64-${TS3SERVER_VERSION}.tar.bz2

WORKDIR teamspeak3-server_linux_amd64

COPY ts3server.ini ./
RUN chown ts3admin:ts3admin ts3server.ini

EXPOSE 9987/udp 10011/tcp 30033/tcp

USER ts3admin

ENTRYPOINT ./ts3server_minimal_runscript.sh inifile=ts3server.ini
