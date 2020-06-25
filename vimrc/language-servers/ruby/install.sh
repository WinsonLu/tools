#!/bin/bash

source ../../include.sh

if [[ $DEBUG == "True" ]]; then
	which gem &> /dev/null
	if [[ $? != 0 ]]; then
		print_error "Can not find executable: gem."
		print_error "Please install gem and try again."
	fi
else
	which gem &> /dev/null
	if [[ $? != 0 ]]; then
		print_error "Can not find executable: gem."
		print_error "Please install gem and try again."
	fi
fi

