#!/bin/sh

sh -x ~/script/prepare.sh

# Go to app folder
cd app
cd $APP_LOCATION # Add an if here

# Install NPM Deps
echo ""
echo "====> Installing app npm dependencies..."
echo ""
meteor npm install

# Build app
# export METEOR_PROFILE=100
# export METEOR_DEBUG_BUILD=1
echo ""
echo "====> Building app..."
echo ""
meteor build --architecture=os.linux.x86_64 ~/bundle --server-only

echo ""
echo "====> App built"
echo ""
