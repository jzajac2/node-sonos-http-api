#!/bin/bash

if [ "$1" == "development" ]; then
    echo "Positional parameter 1 contains development"
    APP_SVR=pi@192.168.50.97
elif [ "$1" == "production" ]; then
    echo "Positional parameter 1 contains production"
    APP_SVR=pi@192.168.50.96
else
  # Default to development
  APP_SVR=pi@192.168.50.97
fi

set -eu
set -x

set +u

APP_DIR_SVR=/home/pi/code/node-sonos-http-api
APP_DIR_LOCAL=.


#mkdir -p $(dirname $APP_DIR_SVR)

rsync --archive --verbose --delete --exclude 'bundle/' --exclude 'node_modules/' $APP_DIR_LOCAL $APP_SVR:$APP_DIR_SVR

# Note: this is spun up on a systemd service and should hot load