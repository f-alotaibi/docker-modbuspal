FROM ghcr.io/linuxserver/baseimage-kasmvnc:alpine320

# set version label
LABEL maintainer="Faleh Alotaibi"

# title
ENV TITLE=Modbuspal
LABEL org.opencontainers.image.source=https://github.com/f-alotaibi/docker-modbuspal

RUN \
  echo "**** Setup ****" && \
  curl -o \
    /app/modbuspal.jar \
    https://yer.dl.sourceforge.net/project/modbuspal/modbuspal/RC%20version%201.6c/ModbusPal.jar?viasf=1 && \
  echo "**** install packages ****" && \
  apk add --no-cache \
    openjdk8 && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000

VOLUME /config
