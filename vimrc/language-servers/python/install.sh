#!/bin/bash

source ../../include.sh

if [[ $DEBUG == "True" ]]; then
	sudo $PIP_CMD install python-language-server
else
	sudo $PIP_CMD install python-language-server &> ./log
fi
