#!/bin/sh
set -e

DEPLOY_CHECK_PORT=80
DEPLOY_CHECK_WAIT_TIME=60
elaspsed=0
while [[ true ]]; do
  sudo docker logs meteor --since 1s
  sleep 1
  elaspsed=$((elaspsed+1))
  curl --fail -L localhost:$DEPLOY_CHECK_PORT && exit 0

  if [ "$elaspsed" == "$DEPLOY_CHECK_WAIT_TIME" ]; then
    echo "Error starting app"
    exit 1
  fi
done
