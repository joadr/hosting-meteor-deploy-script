#!/bin/sh
set -e

# Install things
echo ""
echo "====> Updating apt registry..."
echo ""
sudo apt-get update > /dev/null

# Install python
echo ""
echo "====> Installing python2.7..."
echo ""
sudo apt-get install build-essential -y > /dev/null
sudo apt-get install python2.7 -y > /dev/null

# Install PhantomJS Deps
echo ""
echo "====> Installing PhantomJs dependencies..."
echo ""
sudo apt-get install build-essential g++ flex bison gperf ruby perl \
  libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
  libpng-dev libjpeg-dev python libx11-dev libxext-dev -y > /dev/null

# Install Meteor
echo ""
echo "====> Installing Meteor..."
echo ""
export HOME=/home/ubuntu
curl https://install.meteor.com/ 2>/dev/null | sh

# Install docker
echo ""
echo "====> Installing Docker..."
echo ""
sh /home/deploy/script/installDocker.sh > /dev/null
