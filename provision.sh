#!/bin/bash

apt-get -y update

dpkg -s npm &>/dev/null || {
    #If not installed then install it
    apt-get -y install nodejs npm
    ln -s /usr/bin/nodejs /usr/bin/node
}

command -v hubot &>/dev/null || {
    # Test if hubot command exists con shell, if not then install it from npm
    #npm install -g yo generator-hubot
    npm install -g hubot coffee-script
}
