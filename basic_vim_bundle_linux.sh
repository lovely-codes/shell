#!/bin/sh

cp /etc/vimrc /etc/vimrc.bk
git clone https://github.com/gmarik/vundle.git /usr/share/vim/vimfiles/bundle/vundle

cat >>/etc/vimrc <<EOF
"-------------------start custom config for golang------------------------"
set nu
filetype indent on
set shiftwidth=4
set softtabstop=4
set tabstop=4

" for vundle
set rtp+=/usr/share/vim/vimfiles/bundle/vundle/  
call vundle#rc('/usr/share/vim/vimfiles/bundle/')  
Plugin 'gmarik/vundle'
Plugin 'gmarik/vundle'
Plugin 'neocomplcache'
Plugin 'The-NERD-Commenter'
Plugin 'bling/vim-airline'
call vundle#end()

let g:mapleader = ','

EOF


sleep 3

