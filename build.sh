#!/bin/sh
set -e

# Go to app folder
cd app
cd $APP_LOCATION # Add an if here

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
# meteor build --architecture=os.linux.x86_64 /home/deploy/bundle --server-only --allow-superuser
cd /home/deploy/bundle/
wget https://github.com/joadr/hosting-meteor-deploy-script/raw/master/bundle/armatucleta.tar.gz
echo ""
echo "====> App built"
echo ""
