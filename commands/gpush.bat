#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg () {
    echo "Brief:"
    echo "    1. git push"
    echo "    2. git add all, commit with [comment], then push"
    echo "Usage:"
    echo "    1. $cmdname"
    echo "    2. $cmdname [comment]"
    echo "Try again"
    echo ""
}

makesure() {
    read yes
    confirm=0
    if [[ $yes == "yes" ]]; then
        confirm=1
    fi
    if [[ $yes == "Yes" ]]; then
        confirm=1
    fi
    if [[ $yes == "Y" ]]; then
        confirm=1
    fi
    if [[ $yes == "y" ]]; then
        confirm=1
    fi
    if [[ $confirm -eq 0 || "$confirm" == "0" ]]; then
        echo "error: user not confirm"
        exit 1
    fi
}


# error 2: not a git repository
if ! git status 1>/dev/null 2>&1; then
    echo "error: git repository not exist"
    helpmsg
    exit 1
fi

branch=$(git status | head -n 1 | awk '{print $3}')

# error 1: git comment is a must
if [[ $# -lt 1 ]]; then
    echo "[lin-vim] git push on '$branch', path: '$PWD'"
    git pull
    git push
else
    comment="$@"

    echo "[lin-vim] git push on '$branch', comment: '$comment', path: '$PWD'"
    echo -n "[lin-vim] yes? "
    makesure

    cd $(groot)
    git pull
    git add -A .
    git commit -m "$comment"
    git push
fi
