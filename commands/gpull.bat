#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg () {
    echo "Brief:"
    echo "    git pull"
    echo "Usage:"
    echo "    $cmdname"
    echo "Try again"
    echo ""
}

if [[ $# -gt 1 ]]; then
    helpmsg
    exit 1
fi

# error 1: not a directory
if ! git status 1>/dev/null 2>&1; then
    echo "error: git repository not exist"
    helpmsg
    exit 1
fi

branch=$(git status | head -n 1 | awk '{print $3}')
echo "[lin-vim] git pull on '$branch', path: '$PWD'"
git pull
git pull --tags
