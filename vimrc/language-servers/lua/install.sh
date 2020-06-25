#!/bin/bash

source ../../include.sh

if [[ $DEBUG == "True" ]]; then
	sudo luarocks install --server=http://luarocks.org/dev lua-lsp
	sudo luarocks install luacheck
else
	sudo luarocks install --server=http://luarocks.org/dev lua-lsp &> ./log
	sudo luarocks install luacheck &>> ./log
fi
