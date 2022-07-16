
FROM debian

ENV SNELL_DOWNLOAD_URL https://github.com/surge-networks/snell/releases/download/v3.0.1/snell-server-v3.0.1-linux-armv7l.zip

ENV SERVER_HOST 0.0.0.0
ENV SERVER_PORT 8388
ENV PSK=
ENV OBFS http
ENV ARGS=

EXPOSE ${SERVER_PORT}/tcp
EXPOSE ${SERVER_PORT}/udp

RUN apt update \
  && apt install -y \
    unzip \
    wget \
  && wget -O snell-server.zip ${SNELL_DOWNLOAD_URL} \
  && unzip snell-server.zip \
  && mv snell-server /usr/local/bin/

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
