#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg () {
    echo "Brief:"
    echo "    git config"
    echo "Usage:"
    echo "    $cmdname"
    echo "Try again"
    echo ""
}

if [ $# -gt 1 ]; then
    helpmsg
    exit 1
fi

git config --global core.fileMode false
git config --global core.longpaths true
git config core.fileMode false
git config core.longpaths false
