#!/bin/bash

source ../../include.sh

if [[ $DEBUG == "True" ]]; then
	sudo npm i -g bash-language-server
else
	sudo npm i -g bash-language-server &> ./log
fi
