#!/bin/bash

source ../../include.sh

if [[ $DEBUG == "True" ]]; then
	which efm-langserver &> /dev/null
	if [[ $? != 0 ]]; then
		go get github.com/mattn/efm-langserver && cp $HOME/go/bin/efm-langserver $HOME_BIN_DIR
	fi
	mkdir -p $HOME/.config/efm-langserver
	cp config.yaml $HOME/.config/efm-langserver/

	sudo npm install -g markdownlint-cli
	sudo $PIP_CMD install vim-vint
else
	if [[ $? != 0 ]]; then
		go get github.com/mattn/efm-langserver &> ./log && cp $HOME/go/bin/efm-langserver &>> ./log
	fi
	mkdir -p $HOME/.config/efm-langserver &>> ./log
	cp config.yaml $HOME/.config/efm-langserver/ &>> ./log

	sudo npm install -g markdownlint-cli &>> ./log
	sudo $PIP_CMD install vim-vint &>> ./log
fi

