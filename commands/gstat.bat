#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg () {
    echo "Brief:"
    echo "    git status"
    echo "Usage:"
    echo "    $cmdname"
    echo "Try again"
    echo ""
}

if [ $# -gt 1 ]; then
    helpmsg
    exit 1
fi

# error 1: not a directory
if ! git status 1>/dev/null 2>&1; then
    echo "error: git repository not exist"
    helpmsg
    exit 1
fi

git status
