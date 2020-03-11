#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: setup.sh [ubuntu|arch]"
	exit
fi

dist=$1
case $dist in
	ubuntu)
		sudo apt install neovim python3 clang-9 python3-pip
		;;
	arch)
		sudo pacman -S neovim python3 clang python-pip
		;;
	*)
		echo "Usage: setup.sh [ubuntu|arch]"
		exit
		;;
esac
sudo pip3 install jedi pynvim

mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim
echo "alias vim='nvim'" >> ~/.zshrc
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
