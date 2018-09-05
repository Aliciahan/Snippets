#!/bin/bash

if [[ -d ~/.vim/colors ]]; then
  cp ./dracula.vim ~/.vim/colors/
else
  mkdir -p ~/.vim/colors &&\
  cp ./dracula.vim ~/.vim/colors/
fi
