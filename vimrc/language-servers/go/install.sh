#!/bin/bash


source ../../include.sh
which go &> /dev/null
if [[ $? != 0 ]]; then
	print_error "Can not find executable file: go."
	print_error "Please install golang."
	exit -1
fi

which go-langserver &> /dev/null
if [[ $? != 0 ]]; then
	if [[ $DEBUG == "True" ]]; then
		go get -u github.com/sourcegraph/go-langserver
	else
		go get -u github.com/sourcegraph/go-langserver &> ./log
	fi
	mv ~/go/bin/go-langserver $HOME_BIN_DIR/
fi
