#!/bin/bash

git clone https://github.com/tomasr/molokai.git ../colors/molokai && mv ~/.vim/colors/molokai/colors/molokai.vim ~/.vim/colors/ && rm -rf ~/.vim/colors/molokai &&\
echo -e "\033[32m [Done] \033[0m"
