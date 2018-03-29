#!/bin/bash

# install JSON processor
apt-get update
apt-get install -y jq

# install latest Node Version Manager
VERSION=$(curl -s https://api.github.com/repos/creationix/nvm/releases/latest | jq -r ".name")
wget -qO- https://raw.githubusercontent.com/creationix/nvm/$VERSION/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# install node version recommended for moodlemobile2 development
nvm install 6.9.1
nvm use 6.9.1

# install the npm required packages
npm install -g bower
npm install -g gulp