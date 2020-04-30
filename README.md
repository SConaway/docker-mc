# docker-mc [![Build Status](https://travis-ci.com/SConaway/docker-mc.svg?branch=master)](https://travis-ci.com/SConaway/docker-mc) [![Image Size](https://images.microbadger.com/badges/image/sconaway/docker-mc.svg)](https://microbadger.com/images/sconaway/docker-mc)


## How to use
There is a `docker-compose.yml` provided for example purposes only. Please review it before use.
or, if you prefer using the `docker` CLI, you can run
```
$ docker run -d \
    -v /etc/localtime:/etc/localtime:ro \
    -v "${PWD}/data:/data" \
    -p "25565:25565" \
    --name minecraft \
    -e PORT=25565 \
    -e INIT_MEMORY=64M \
    -e MAX_MEMORY=4096M \
    -e SERVER_JAR=minecraft_server.1.15.jar \
    --stop-timeout 60 \
    sconaway/docker-mc
```
if you're on linux, or
```
$ docker run -d \
    -v "${PWD}/data:/data" \
    -p "25565:25565" \
    --name minecraft \
    -e PORT=25565 \
    -e INIT_MEMORY=64M \
    -e MAX_MEMORY=4096M \
    -e SERVER_JAR=minecraft_server.1.15.jar \
    --stop-timeout 60 \
    sconaway/docker-mc
```
if you're on Windows or macOS.

## Tags
`latest`, `14-jre-alpine` use `adoptopenjdk`'s  `14-jre-alpine` at [https://hub.docker.com/r/adoptopenjdk/openjdk14](https://hub.docker.com/r/adoptopenjdk/openjdk14).

`11-jre-alpine` uses `adoptopenjdk`'s  `11-jre-alpine` at [https://hub.docker.com/r/adoptopenjdk/openjdk11](https://hub.docker.com/r/adoptopenjdk/openjdk11).

`8-jre-alpine` uses `adoptopenjdk`'s  `8-jre-alpine` at [https://hub.docker.com/_/openjdk](https://hub.docker.com/_/openjdk).


## Credits
- `openjdk` and `adoptopenjdk` for their docker images of Java 8, 11, and 14 JRE in `alpine linux` .
- `rcon-web-admin` for `rcon-web-admin`: [https://github.com/rcon-web-admin/rcon-web-admin](https://github.com/rcon-web-admin/rcon-web-admin).
- itzg for his `rcon-web-admin` docker image: [https://hub.docker.com/r/itzg/rcon](https://hub.docker.com/r/itzg/rcon).
- itzg again for his `mc-server-runner`, which wraps the `java` process and ensures that things are stopped correctly: [https://github.com/itzg/mc-server-runner](https://github.com/itzg/mc-server-runner).
