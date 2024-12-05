#!/bin/bash

# Script to set up Vim for Bash scripting

# Ensure Vim is installed
echo "Installing Vim if not already installed..."
sudo apt update && sudo apt install -y vim

# Create or update the .vimrc file
echo "Configuring Vim for Bash scripting..."
cat <<EOL >> ~/.vimrc
" Enable syntax highlighting
syntax on

" Set file type detection and plugins
filetype plugin indent on

" Set proper tab stops and indentation for shell scripts
set tabstop=4       " Width of a tab character
set shiftwidth=4    " Number of spaces to use for autoindent
set expandtab       " Convert tabs to spaces
set autoindent      " Copy indent from the previous line

" Highlight search results
set hlsearch
set incsearch

" Enable line numbers
set number

" Enable auto-completion for commands
set wildmenu

" Show matching brackets
set showmatch

" Display trailing spaces or tabs
set list
set listchars=tab:>-,trail:·

" Enable persistent undo
set undofile

" Set color scheme (adjust based on your preference)
colorscheme desert

" Automatically detect Bash scripts
autocmd BufRead,BufNewFile *.sh set filetype=sh

" Enable folding
set foldmethod=syntax
set foldlevelstart=99
EOL

# Install Vundle plugin manager
echo "Installing Vundle plugin manager..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Add plugins to .vimrc
echo "Adding plugins to .vimrc..."
cat <<EOL >> ~/.vimrc
" Vundle plugin configuration
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'  " Syntax checking
Plugin 'ervandew/supertab'     " Tab auto-completion
Plugin 'b4winckler/vim-bash-syntax' " Enhanced Bash syntax
call vundle#end()

filetype plugin indent on
EOL

# Install Vim plugins
echo "Installing Vim plugins..."
vim +PluginInstall +qall

# Confirm setup completion
echo "Vim setup for Bash scripting completed!"
