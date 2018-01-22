#! /usr/bin/env bash

set -e

cmdname=${0##*/}

helpmsg () {
    echo "Brief: Git branch commands"
    echo "    1. new [branch]"
    echo "    2. delete [branch] and switch to master"
    echo "    3. delete [branch] and switch to [other] branch"
    echo "    4. stash all and switch [branch]"
    echo "    5. raw switch [branch], equal to 'checkout'"
    echo "Usage:"
    echo "    1. $cmdname new [branch]"
    echo "    2. $cmdname delete [branch] and "
    echo "    3. $cmdname push [comment]"
    echo "    4. $cmdname pull"
    echo "Try again"
    echo ""
}

# error 1: git comment is a must
if [[ $# -gt 1 ]]; then
    helpmsg
    exit 1
fi

# error 2: not a git repository
if ! git status 1>/dev/null 2>&1; then
    echo "error: git repository not exist"
    helpmsg
    exit 1
fi

cd $(gitroot)

case $1 in
    add)
        shift
        gitadd $@
        ;;
    commit)
        shift
        gitcommit $@
        ;;
    push)
        shift
        gitpush $@
        ;;
    pull)
        shift
        gitpull $@
        ;;
    *)
        helpmsg
        exit 1
esac
