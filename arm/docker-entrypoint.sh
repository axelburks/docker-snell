#!/bin/sh
CONF="/etc/snell/snell-server.conf"

launch() {
  if [ -f ${CONF} ]; then
    echo "Found existing config..."
  else
    if [ -z ${PSK} ]; then
      PSK=`hexdump -n 16 -e '4/4 "%08x" 1 "\n"' /dev/urandom`
      echo "Using generated PSK: ${PSK}"
    else
      echo "Using predefined PSK: ${PSK}"
    fi
    echo "Generating new config..."
    mkdir /etc/snell/
    cat > ${CONF} <<EOF
[snell-server]
listen = 0.0.0.0:${PORT}
psk = ${PSK}
obfs = ${OBFS}
EOF
  fi
  cat ${CONF}
  snell-server \
    -c ${CONF} \
    ${ARGS}
}


if [ -z "$@" ]; then
  launch
else
  exec "$@"
fi
