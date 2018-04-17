#!/bin/bash

OFFICIAL_GIT_REPO='https://github.com/moodlehq/moodlemobile2.git'
FORKED_GIT_REPO='https://github.com/santosleonardo/moodlemobile2.git'

# set timezone
sudo timedatectl set-timezone America/Sao_Paulo

# configure git identity
git config --global user.name "Leonardo Santos"
git config --global user.email leoss40@gmail.com

# install JSON processoe and requirements to run setup
sudo apt-get update
sudo apt-get install -y jq python make g++

# install latest Node Version Manager
VERSION=$(curl -s https://api.github.com/repos/creationix/nvm/releases/latest | jq -r ".name")
wget -qO- https://raw.githubusercontent.com/creationix/nvm/$VERSION/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# install node LTS version
nvm install --lts
nvm use --lts

# install ionic
npm cache clean
npm install -g cordova@6.5.0 ionic@2.2.3 bower gulp

# clone the app base code
git clone $FORKED_GIT_REPO /vagrant/moodlemobile2
cd /vagrant/moodlemobile2

# add official repository as upstream
git remote add upstream $OFFICIAL_GIT_REPO