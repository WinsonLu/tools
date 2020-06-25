#!/bin/bash

source ../../include.sh

if [[ $DEBUG == "True" ]]; then
	sudo npm i -g purescript-language-server
else
	sudo npm i -g purescript-language-server &> ./log
fi


