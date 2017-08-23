#!/bin/bash

yum install -y automake gcc gcc-c++ kernel-devel cmake python-devel python3-devel


cd /tmp && git clone https://github.com/vim/vim.git && cd vim
./configure --enable-pythoninterp --prefix=/usr
make && sudo make install
