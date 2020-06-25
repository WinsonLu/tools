#!/bin/bash

source ../../include.sh

if [[ $DEBUG == "True" ]]; then
	$PIP_CMD install python-language-server
else
	$PIP_CMD install python-language-server &> ./log
fi
