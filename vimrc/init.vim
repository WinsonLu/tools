call plug#begin('~/.vim/plugged')
	" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
	Plug 'ncm2/ncm2'
	Plug 'roxma/nvim-yarp'


	" IMPORTANT: :help Ncm2PopupOpen for more information
	set completeopt=noinsert,menuone,noselect

	" NOTE: you need to install completion sources to get completions. Check
	" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-path'
	Plug 'ncm2/ncm2-tmux'
	Plug 'ncm2/ncm2-jedi'
	Plug 'ncm2/ncm2-pyclang'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/nerdcommenter'
	Plug 'jiangmiao/auto-pairs'
	Plug 'airblade/vim-gitgutter'
	Plug 'flazz/vim-colorschemes'
	autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>
	" enable NERDTree when vim is launched
	" autocmd vimenter * NERDTree
	" enable ncm2 for all buffers
	autocmd BufEnter * call ncm2#enable_for_buffer()
	autocmd vimenter * GitGutterEnable
call plug#end()
"' path to directory where libclang.so can be found
let g:ncm2_jedi#python_version = 3
let g:ncm2_jedi#python3_host_prog='/usr/bin/python3'
let g:ncm2_pyclang#library_path = '/usr/lib/llvm-9/lib/libclang.so.1'
" or path to the libclang.so file
"let g:ncm2_pyclang#library_path = '/usr/lib/'

let g:gitgutter_git_executable = '/usr/bin/git'
