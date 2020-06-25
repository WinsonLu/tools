#!/bin/bash 

source ../../include.sh

if [[ $DEBUG == "True" ]]; then
	rm -rf ./rnix-lsp
	cargo clean &> /dev/null
else
	rm -rf ./rnix-lsp &> ./log
	cargo clean &> /dev/null
fi
