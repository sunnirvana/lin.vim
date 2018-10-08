#!/usr/bin/env bash

cd ~/.vim
git pull

if [ $(uname) == "Linux" ]; then
    if cat /etc/*release | grep ^NAME | grep Ubuntu 1>/dev/null 2>&1; then
        bash ~/.vim/install/ubuntu.sh
    elif cat /etc/*release | grep ^NAME | grep Debian 1>/dev/null 2>&1; then
        bash ~/.vim/install/debian.sh
    elif cat /etc/*release | grep ^NAME | grep Fedora 1>/dev/null 2>&1; then
        bash ~/.vim/install/fedora.sh
    else
        echo "[lin-vim] OS not supprot, cannot install"
        exit 1;
    fi
elif [ $(uname) == "FreeBSD" ]; then
    bash ~/.vim/install/bsd.sh
elif [ $(uname) == "Darwin" ]; then
    bash ~/.vim/install/macos.sh
else
    echo "[lin-vim] Please try 'cmd install.bat'"
fi
