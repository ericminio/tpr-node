#!/bin/bash

function push() {
    echo "TPR -> push"
    git push
}
function rebase() {
    echo "TPR -> rebase"
    git pull --rebase 
    conflict=$(git status | grep "both modified" | tail -n 1 | wc -l)
    if [ $conflict -eq 1 ]; then
        git rebase --abort
        echo "discarding commit:"
        git show HEAD
        git reset --hard HEAD~1
        git pull
        touch $TTT_REPO/.tpr-rebase-conflicted
    else
        touch $TTT_REPO/.tpr-rebase-successful
    fi
}

function tpr() {
    cd $TTT_REPO    
    tcr && push || rebase
}
