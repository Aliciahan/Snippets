<h1 align="center">Snippets Collection For UltiSnips VIM</h1>

## Installation Example for Ubuntu

1. Prepare the .vim repository

~~~bash

mkdir -p ~/.vim &&\
cd ~/.vim 
~~~

2. Clone the project 

> git clone https://github.com/Aliciahan/Snippets.git

3. Rename the project to UltiSnips

> cd ~/.vim/Snippets && chmod +x renameFolder.sh && ./renameFolder.sh && cd .. && cd UltiSnips

4. Copy the vimrc file to user's home

> cp ~/.vim/UltiSnips/.vimrc ~/

5. Install Vundle

> git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

6. Install all plugins 

> vim ~/.vimrc

Then type: 

> :PluginInstall

Wait for the bundle finish itself.

7. Install Dependencies for YCM Compilation

> ~/.vim/UltiSnips/instlUbuntu.sh

8. Compile YCM

>  ~/.vim/bundle/YouCompleteMe/install.py --clang-completer

9. Compile YCM

> cd ~/.vim/bundle/YouCompleteMe && install.py

Attention, If you are particularly interested in some programming languages please visit the Github page for YouCompleteMe.



## Congratulations

All set up.

Some times the errors produce during the vim version, or vim not compiled with python, there are the other pbs during the compile of YCM. You should read carefully the hints then there exists always a solution in the Internet. 

Good luck.



