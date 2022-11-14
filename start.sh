#!/bin/bash
set -e

# Options for starting
: ${USER:="root"}
: ${GROUP:="root"}

: ${CONFIG_DIR:="config"}

if [ ! -d "/app/${CONFIG_DIR}" ]
then
  echo "Creating mount dir (/app/${CONFIG_DIR})"
  mkdir -p /app/${CONFIG_DIR}
  echo "Setting owner rights (${USER}:${GROUP} to /app/${CONFIG_DIR})"
  chown -R ${USER}:${GROUP} /app/
else
  echo "Setting owner rights (${USER}:${GROUP} to /app/${CONFIG_DIR})"
  chown -R ${USER}:${GROUP} /app/
fi

if [[ ! -f "/app/${CONFIG_DIR}/config.default" || ! -f "/app/${CONFIG_DIR}/config.json" ]]
then
  echo "Coping the default config, please edit it an rename it to 'config.json'."
  cp /app/default/config.default /app/${CONFIG_DIR}/
  exit 1
fi

echo "Starting NOALBS Daemon"
exec /app/noalbs
