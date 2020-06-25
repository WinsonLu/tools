#!/bin/bash

source ../../include.sh

if [[ $DEBUG == "True" ]]; then
	sudo npm install -g dockerfile-language-server-nodejs
else
	sudo npm install -g dockerfile-language-server-nodejs &> ./log
fi

