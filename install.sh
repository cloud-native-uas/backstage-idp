#!/usr/bin/env bash
sudo apt update \
&& sudo apt install -y npm \
&& curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
&& . ~/.bashrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install 18 \
&& sudo npm install yarn -g \
&& sudo npm install bash-language-server -g \
&& cd mcce-idp \
&& yarn tsc \
&& yarn install --frozen-lockfile

IP_ADDRESS="$(curl ifconfig.me)"
cat << EOF
To use this backstage instance:

nvm use 18
export IP_ADDRESS=${IP_ADDRESS}
cd mcce-idp
yarn run dev
EOF
