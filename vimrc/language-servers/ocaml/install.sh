#!/bin/bash

source ../../include.sh

if [[ $DEBUG == "True" ]]; then
	sudo npm install -g ocaml-language-server
else
	sudo npm install -g ocaml-language-server &> ./log
fi
