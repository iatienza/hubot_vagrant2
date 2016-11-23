#!/bin/bash

apt-get -y update

if ! grep -q "nodesource" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
fi

dpkg -s npm &>/dev/null || {
    #If not installed then install it
    apt-get -y install nodejs
    #ln -s /usr/bin/nodejs /usr/bin/node -> No needed for version 6.x
}

command -v hubot &>/dev/null || {
    # Test if hubot command exists con shell, if not then install it from npm
    npm install -g yo generator-hubot
    #npm install -g hubot coffee-script
}
