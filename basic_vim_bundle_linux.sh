#!/bin/sh

cp /etc/vimrc /etc/vimrc.bk
git clone https://github.com/gmarik/vundle.git /usr/share/vim/vimfiles/bundle/vundle

cat >>/etc/vimrc <<EOF

"-------------------start custom vim config ------------------------"

set nu
filetype indent on
set shiftwidth=4
set softtabstop=4
set tabstop=4

" for vundle
set rtp+=/usr/share/vim/vimfiles/bundle/vundle/  
call vundle#rc('/usr/share/vim/vimfiles/bundle/')  
Plugin 'neocomplcache'
Plugin 'The-NERD-Commenter'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
call vundle#end()

let g:mapleader = ','
map <C-n> :NERDTreeToggle<CR>
let g:neocomplcache_enable_at_startup = 1 
let g:neocomplcache_enable_auto_select = 1 

EOF


sleep 3

