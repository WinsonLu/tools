#!/bin/bash

source ../../include.sh


if [[ $DEBUG == "True" ]]; then
	ghc_version=`ghc --version | awk '{print $NF;}'`
	sudo stack upgrade
	if [[ ! -d ./haskell-ide-engine/.git ]]; then
		rm -rf haskell-ide-engine
		git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules
	fi
	cd haskell-ide-engine
	stack ./install.hs hie-$ghc_version
	stack ./install.hs data
else 
	sudo stack upgrade &>> ./log
	if [[ ! -d ./haskell-ide-engine/.git ]]; then
		rm -rf haskell-ide-engine
		git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules &>> ./log
	fi
	cd haskell-ide-engine
	stack ./install.hs hie-$ghc_version &>> ../log
	stack ./install.hs data &>> ../log
fi
