#!/bin/bash


source ../../include.sh

which rustup &> /dev/null
if [[ $? != 0 ]]; then
	print_error "Can not find executable: rustup."
	print_error "Please install rustup."
fi

if [[ $DEBUG == "True" ]]; then
	rustup component add rls rust-analysis rust-src
else
	rustup component add rls rust-analysis rust-src &> ./log
fi
