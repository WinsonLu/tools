#!/bin/bash

source ../../include.sh

if [[ $DEBUG == "True" ]]; then
	if [[ ! -d rnix-lsp/.git ]]; then
		rm -rf rnix-lsp &> /dev/null
		git clone https://github.com/nix-community/rnix-lsp
	fi
	cd rnix-lsp &> /dev/null
	cargo build --release && cp ./target/release/rnix-lsp $HOME_BIN_DIR
else
	if [[ ! -d rnix-lsp/.git ]]; then
		rm -rf rnix-lsp &> /dev/null
		git clone https://github.com/nix-community/rnix-lsp
	fi
	cd rnix-lsp &> /dev/null
	cargo build --release &> ../log && cp ./target/release/rnix-lsp $HOME_BIN_DIR &>> ../log
fi
