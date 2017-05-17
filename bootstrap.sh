#!/bin/bash

OFFICIAL_GIT_REPO='https://github.com/moodlehq/moodlemobile2.git'
FORKED_GIT_REPO='https://github.com/santosleonardo/moodlemobile2.git'

# install Node Version Manager
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# install node version recommended for moodlemobile2 development
nvm install 0.12.15
nvm use 0.12.15

# install ionic
npm cache clean
npm install -g cordova ionic

# install the npm required packages
npm install -g bower
npm install -g gulp

# clone the app base code
git clone $FORKED_GIT_REPO /vagrant/moodlemobile2
cd /vagrant/moodlemobile2

# add official repository as upstream
git remote add upstream $OFFICIAL_GIT_REPO

# Install the npm plugins dependencies
npm install

# Add the iOS and Android platforms and install the required Cordova plugins
ionic platform add android@5.1.1
ionic platform add ios@4.1.0

# Install bower globally and the required javascript files
bower install