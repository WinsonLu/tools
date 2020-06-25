#!/bin/bash

source ../../include.sh

PIP_CMD=pip
which $PIP_CMD &> /dev/null
if [[ $? != 0 ]]; then
	PIP_CMD=pip3
fi

if [[ $DEBUG == "Tue" ]]; then
	$PIP_CMD install cmake-language-server
else
	$PIP_CMD install cmake-language-server &> ./log
fi
