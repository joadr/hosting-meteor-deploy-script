#!/bin/sh
set -e

echo "Auto detected script"

DETECTED_METEOR_VERSION=$(bash /home/deploy/script/getMeteorVersion.sh)
echo "Detected Meteor version \"$DETECTED_METEOR_VERSION\""


FINAL_DOCKER_IMAGE=$(bash /home/deploy/script/getDockerImage.sh)
echo "Using docker image \"$FINAL_DOCKER_IMAGE\""

sh /home/deploy/script/prepare.sh

# Go to app folder
cd app
cd $APP_LOCATION

# Install NPM Deps
echo ""
echo "====> Installing app npm dependencies..."
echo ""
export PYTHON="/usr/bin/python2.7"
meteor npm install > /dev/null

# Build app
# export METEOR_PROFILE=100
# export METEOR_DEBUG_BUILD=1
echo ""
echo "====> Moving bundle..."
echo ""
ls /home/deploy
mkdir /home/deploy/bundle
cd /home/deploy/bundle
wget $BUILD_BUNDLE
echo ""
echo "====> App built"
echo ""
