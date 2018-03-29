#!/bin/bash

OFFICIAL_GIT_REPO='https://github.com/moodlehq/moodlemobile2.git'
FORKED_GIT_REPO='https://github.com/santosleonardo/moodlemobile2.git'

# configure git identity
git config --global user.name "Leonardo Santos"
git config --global user.email leoss40@gmail.com

# install latest version of github hub and alias is as git
HUB_DOWNLOAD_URL=$(curl -s https://api.github.com/repos/github/hub/releases/latest | jq -r ".assets[].browser_download_url" | grep linux-amd64)

wget -qO- $HUB_DOWNLOAD_URL | tar -zxv
cd hub* && sudo ./install
cd .. && rm -rf hub*
echo "alias git=hub" >> ~/.bashrc

# install latest Node Version Manager
VERSION=$(curl -s https://api.github.com/repos/creationix/nvm/releases/latest | jq -r ".name")
wget -qO- https://raw.githubusercontent.com/creationix/nvm/$VERSION/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# install node version recommended for moodlemobile2 development
nvm install 6.9.1
nvm use 6.9.1

# install ionic
npm cache clean
npm install -g cordova@6.5.0 ionic@2.2.3

# clone the app base code
git clone $FORKED_GIT_REPO /vagrant/moodlemobile2
cd /vagrant/moodlemobile2

# add official repository as upstream
git remote add upstream $OFFICIAL_GIT_REPO