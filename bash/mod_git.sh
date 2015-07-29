#!/bin/bash

function git_branch {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    if [ -e $branch ]; then
        return
    else
        if [ $branch == 'master' ]; then
            COLOR="${SPLG_GREEN}"
        elif [ $branch == 'development' ]; then
            COLOR="${SPLG_ORANGE}"
        elif [ $branch == 'dev' ]; then
            COLOR="${SPLG_ORANGE}"
        else
            COLOR="${SPLG_PINK}"
        fi

        echo -e "${SPLG_LGREY}\302\261${COLOR}${branch}"

    fi
}

function branch {
    git symbolic-ref --short HEAD
}

# Git
alias pp='git pull --rebase && git push'
alias gc='git clone'
alias gs='git status'
alias gl='git lg'
