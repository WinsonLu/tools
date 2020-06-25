#!/bin/bash


. ./include.sh

CUR_DIR=`pwd`
LANG_SERVICE_DIR=$CUR_DIR/language-servers
HOME_BIN_DIR=$HOME/bin

if [ $# -ne 1 ]
then
	print_error "Usage: setup.sh [ubuntu|arch|clean]"
	exit
fi

DIST=$1

# Step.1
case $DIST in
	ubuntu)
		print_info "Installing dependencies..."
		sudo apt install neovim python3 clang-9 python3-pip ccls nodejs npm luarocks lua5.3 liblua5.3-dev haskell-stack -y &> /dev/null
		;;
	arch)
		print_info "Installing dependencies..."
		sudo pacman -S neovim python3 clang python-pip ccls nodejs npm luarocks lua stack
		;;
	clean)
		print_info "Clean language servers..."
		for i in `ls ./language-servers`; do
			print_info "Cleaning $i"
			check_and_exit
			cd ./language-servers/$i && ./clean.sh
			cd $CUR_DIR
		done
		print_succ "Done."
		exit 0
		;;
	*)
		print_error "Usage: setup.sh [ubuntu|arch|clean]"
		exit
		;;
esac
setup_home_bin_dir

# Step.2
print_info "Installing python dependencies..."
$PIP_CMD install jedi pynvim &> /dev/null
check_and_exit

# Step.3
print_info "Copying init.vim to ~/.config/nvim"
mkdir -p ~/.config/nvim/autoload > /dev/null
cp init.vim ~/.config/nvim
cp coc-settings.json ~/.config/nvim
setup_alias_nvim
check_and_exit


# Step.4
print_info "Installing vim-plug"
if [[ ! -f vim-plug/plug.vim ]]; then
	git clone https://github.com/junegunn/vim-plug/ && cp ./vim-plug/plug.vim ~/.config/nvim/autoload/
fi
check_and_exit

# Step.5
print_info "Installing rustup..."
which rustup &> /dev/null
if [[ $? != 0 ]]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
check_and_exit

# Step.6
print_info "Installing language servers..."
# get excluded-lsp
excluded_lsp=()
index=1
for lsp in `cat excluded_lsp.txt`; do
	excluded_lsp[$index]=$lsp
	index=$((index+1))
done

for ls_dir in `ls $LANG_SERVICE_DIR`; do
	exist=0
	for lsp in ${excluded_lsp[@]}; do
		[[ "$ls_dir" == "$lsp" ]] && print_info "Skip $ls_dir..." && exist=1 && break 
	done
	[[ $exist == 1 ]] && continue
	print_info "Installing $ls_dir..."
	cd $LANG_SERVICE_DIR/$ls_dir
	./install.sh
	check_and_exit
	cd $CUR_DIR
done
cd $CUR_DIR
print_succ "Done."
