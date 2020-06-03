#!/bin/bash

docker run -v $(pwd):/root/.vim/UltiSnips --rm -it centos:8 bash  -c "\
  yum update -y &&\
  yum install -y vim git &&\
  yum install -y automake gcc gcc-c++ make kernel-devel cmake python-devel python3-devel ncurses-devel ncurses-libs &&\
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &&\
  cp /root/.vim/UltiSnips/.vimrc /root/.vimrc &&\
  cd /root &&\
  vim +PluginInstall +qall &&\
  cd /root/.vim/bundle/YouCompleteMe &&\
  ./install.py &&\
  cd /root/.vim &&\
  tar -zcvf bundle-centos.tgz bundle &&\
  mv ./bundle-centos.tgz /root/.vim/UltiSnips/
"
