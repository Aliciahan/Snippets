#!/bin/bash

yum install -y automake gcc gcc-c++ kernel-devel cmake python-devel python3-devel ncurses-devel ncurses-libs


cd /tmp && git clone https://github.com/vim/vim.git && cd vim
./configure --enable-pythoninterp=yes --enable-python3interp=yes --prefix=/usr
make && sudo make install
