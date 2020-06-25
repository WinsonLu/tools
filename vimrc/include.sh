#!/bin/bash

HOME_BIN_DIR=$HOME/bin
DEBUG=False
SHELL_NAME=`echo $SHELL | awk 'BEGIN{FS="/";}{print $(NF)}'`
SHELL_INIT_SCRIPT=$HOME/.${SHELL_NAME}rc

PIP_CMD=pip
which $PIP_CMD &> /dev/null
if [[ $? != 0 ]]; then
	PIP_CMD=pip3
fi

FILENAME=$(echo $0 | awk 'BEGIN{FS="/";}{print $(NF);}')

print_info() {
	echo -e "[$(pwd)/$FILENAME] \\033[0;34m$1\\033[0m"
}

print_error() {
	echo -e "[$(pwd)/$FILENAME] \\033[0;31m$1\\033[0m"
}

print_succ() {
	echo -e "[$(pwd)/$FILENAME] \\033[0;32m$1\\033[0m"
}


setup_home_bin_dir() {
	if [[ -e $HOME_BIN_DIR && ! -d $HOME_BIN_DIR ]]; then
		print_error "$HOME_BIN_DIR is not a directory. please delete it and try again."
		exit -1
	elif [ ! -e $HOME_BIN_DIR ]; then
		mkdir -p $HOME_BIN_DIR > /dev/null
	fi

	if [[ ! -f $SHELL_INIT_SCRIPT ]]; then
		touch $SHELL_INIT_SCRIPT
		echo "export PATH=\$PATH" >> $SHELL_INIT_SCRIPT
	fi
	grep "^[\\t ]*export[\\t ]*PATH=.*\?[=:]\?$HOME_BIN_DIR:\?.*$" $SHELL_INIT_SCRIPT &> /dev/null
	if [[ $? != 0 ]]; then
		grep "^[\\t ]*export[\\t ]*PATH=.*$" $SHELL_INIT_SCRIPT &> /dev/null
		if [[ $? == 0 ]]; then
			sed -i "s|\(^[\t ]*\?export[\t ]*\?PATH=.*$\)|\1:$HOME_BIN_DIR|g" $SHELL_INIT_SCRIPT
		else
			echo "export PATH=\$PATH:$HOME_BIN_DIR" >> $SHELL_INIT_SCRIPT
		fi
	fi
}

setup_alias_nvim() {
	if [[ ! -f $HOME/.zshrc ]]; then
		touch $SHELL_INIT_SCRIPT
		echo "alias vim='nvim'" >> $SHELL_INIT_SCRIPT
	fi
	grep "[\\t ]*alias[\\t ]*vim='nvim'" $SHELL_INIT_SCRIPT &> /dev/null
	if [[ $? != 0 ]]; then
		echo "alias vim='nvim'" >> $SHELL_INIT_SCRIPT
	fi
}

check_and_exit() {
	if [[ $? != 0 ]]; then
		print_error "Error."
		exit 1
	fi
}
