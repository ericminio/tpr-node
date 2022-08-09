#!/bin/bash

source ./dir.sh
source ./tcr.sh

DIR=$(current_dir ${BASH_SOURCE[0]})

function push() {
    echo "tpr -> push"
    git push
}
function rebase() {
    echo "tpr -> rebase"
    git pull --rebase 
    conflict=$(git status | grep "both modified" | tail -n 1 | wc -l)
    if [ $conflict = 1 ]; then
        git rebase --abort
        echo "discarding commit:"
        git show HEAD
        git reset --hard HEAD~1
        git pull
    fi
}

function tpr() {
    cd $TTT_REPO    
    tcr && push || rebase
}
