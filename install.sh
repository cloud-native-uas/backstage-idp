#!/usr/bin/env bash

# Install npm and nvm
sudo apt update \
&& sudo apt install -y npm \
&& curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
&& . ~/.bashrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Install npm and yarn dependencies for backstage
nvm install 18 \
&& sudo npm install yarn -g \
&& sudo npm install bash-language-server -g \
&& sudo npm install npm install typescript -g \
&& cd mcce-idp \
&& yarn install --frozen-lockfile \
&& yarn tsc

# Get public IP address and print next steps

IP_ADDRESS="$(curl ifconfig.me)"

clear
cat << EOF

##################################
 To use this backstage instance:
##################################
. ~/.bashrc
nvm use 18

export IP_ADDRESS=${IP_ADDRESS}
cd mcce-idp

yarn run dev
##################################

EOF
