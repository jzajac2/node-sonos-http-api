#!/bin/bash
set -eu
set -x
set +u
APP_DIR_SVR=/home/pi/code/node-sonos-http-api
if [ "$1" == "development" ]; then
    echo "Positional parameter 1 contains development"
    cd $APP_DIR_SVR
    setsid npm start > /dev/null 2>&1 & 
elif [ "$1" == "production" ]; then
    echo "Positional parameter 1 contains production"
    setsid npm start > /dev/null 2>&1 &
else
    echo "You must speficy either 'development' or 'production'"
fi

