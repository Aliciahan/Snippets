#!/bin/bash

apt-get update -y && apt-get install -y build-essential cmake python python-dev python3-dev

echo -e "\033[32m [Done] \033[0m Now you can run ~/.vim/bundle/YouCompleteMe/install.py --clang-completer for installation."
