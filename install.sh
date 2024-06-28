#!/usr/bin/env bash
sudo apt update \
&& curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
&& . ~/.bashrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

. ~/.bashrc nvm install 18 \
&& nvm use 18 \
&& cd mcce-idp \
&& yarn install --frozen-lockfile \
&& yarn tsc