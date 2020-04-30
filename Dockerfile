FROM adoptopenjdk/openjdk14:alpine-jre


ENV PORT=25565

ENV JVM_XX_OPTS="-XX:+UseG1GC" MEMORY="1G" GUI=FALSE

ARG ARCH=amd64

RUN \
  apk add --no-cache \
    bash

COPY setup /

RUN ["/bin/bash", "/setup"]

COPY start /

WORKDIR /data

RUN chmod +x /usr/local/bin/*

HEALTHCHECK --start-period=2m CMD mcstatus localhost:$PORT ping

CMD ["/bin/bash", "/start"]
