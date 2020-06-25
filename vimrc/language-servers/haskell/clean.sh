#!/bin/bash 

source ../../include.sh

if [[ $DEBUG == "True" ]]; then
	rm -rf ./haskell-ide-engine &> /dev/null
else
	rm -rf ./haskell-ide-engine &> /dev/null
fi
