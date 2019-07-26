#!/usr/bin/env bash

sudo echo "[lin-vim] Install for MacOS" || { echo "[lin-vim] sudo not found"; exit 1; }

# Prepare Environment
if [ -f ~/.linvimrc ]; then
    mv ~/.linvimrc ~/.linvimrc.bak
fi
touch ~/.linvimrc
touch ~/.bashrc
touch ~/.zshrc

# Software Dependency
brew install git macvim zsh
brew install curl wget llvm autoconf automake cmake clang-format pkg-config
brew install openssl openssh cryptopp
brew install the_silver_searcher python3 node
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
sudo pip3 install pyOpenSSL pep8 flake8 pylint autopep8 yapf cpplint
sudo npm install -g --unsafe-perm js-beautify eslint tslint typescript-formatter
if [ -d ~/.config ]; then
    sudo chmod -R +rwx ~/.config
    sudo chown -R $USER ~/.config
fi

# Git Config
cd ~/.vim
git config core.filemode false
git config core.longpaths true
git config push.default simple
git config pull.default simple
git config core.editor vim
git config credential.helper store
git config --global core.filemode false
git config --global core.longpaths true
git config --global push.default simple
git config --global pull.default simple
git config --global core.editor vim
git config --global credential.helper store

# Vim Plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/.vim/lin.vim ~/.vimrc
vim -c "PlugInstall" -c "qall"
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clang-completer

# GuiFonts
font_dir="$HOME/Library/Fonts"
mkdir -p $font_dir
cd ~/.vim/guifonts
find_command="find $HOME/.vim/guifonts \( -name '$prefix*.[o,t]tf' -or -name '$prefix*.pcf.gz' \) -type f -print0"
eval $find_command | xargs -0 -n1 -I % cp "%" "$font_dir/"
fc-cache -f $font_dir

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Path Variable
echo "#! /usr/bin/env bash" >> ~/.linvimrc
echo "setopt HIST_IGNORE_ALL_DUPS" >> ~/.linvimrc
echo "export LANGUAGE='en_US.UTF-8'" >> ~/.linvimrc
echo "ulimit -c unlimited" >> ~/.linvimrc
echo "alias vim=/usr/local/bin/vim" >> ~/.linvimrc
echo "alias l=\"ls -lhS\"" >> ~/.linvimrc
echo "alias ll=\"ls -lahS\"" >> ~/.linvimrc
echo "source /Users/$(whoami)/.linvimrc" >> ~/.zshrc
echo "[[ -s \"/Users/$(whoami)/.linvimrc\" ]] && source \"/Users/$(whoami)/.linvimrc\"" >> ~/.zshrc
echo "source /Users/$(whoami)/.linvimrc" >> ~/.bashrc
echo "[[ -s \"/Users/$(whoami)/.linvimrc\" ]] && source \"/Users/$(whoami)/.linvimrc\"" >> ~/.bashrc
source ~/.bashrc 1>/dev/null 2>&1
source ~/.zshrc 1>/dev/null 2>&1
