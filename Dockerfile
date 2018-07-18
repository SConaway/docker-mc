FROM openjdk:8-jre-alpine

ENV PORT=25565

ENV JVM_XX_OPTS="-XX:+UseG1GC" MEMORY="1G" GUI=FALSE
#    TYPE=VANILLA VERSION=LATEST FORGEVERSION=RECOMMENDED SPONGEBRANCH=STABLE SPONGEVERSION= LEVEL=world \
#    PVP=true DIFFICULTY=easy ENABLE_RCON=true RCON_PORT=25575 RCON_PASSWORD=minecraft \
#    LEVEL_TYPE=DEFAULT GENERATOR_SETTINGS= WORLD= MODPACK= PORT=25565 ONLINE_MODE=TRUE CONSOLE=true

ARG ARCH=amd64

RUN \
  apk add --no-cache \
    curl \
    tar \
    gzip \
    bash \
    python3 \
    py3-pip && \
  pip3 install mcstatus

HEALTHCHECK CMD mcstatus localhost:$PORT ping

RUN \
  LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/itzg/mc-server-runner/releases/latest) && \
  LATEST_VERSION=$(echo "$LATEST_RELEASE" | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/') && \
  RUNNER_URL="https://github.com/itzg/mc-server-runner/releases/download/$LATEST_VERSION/mc-server-runner_" && \
  RUNNER_URL="$RUNNER_URL""$LATEST_VERSION""_linux_$ARCH.tar.gz" && \
  curl -L "$RUNNER_URL" | tar  xvz && \
  mv mc-server-runner /usr/local/bin

ADD start /

WORKDIR /data

RUN chmod +x /usr/local/bin/*

CMD ["/bin/bash", "/start"]
