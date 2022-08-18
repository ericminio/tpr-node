#!/bin/bash

function push() {
    echo "tpr -> push"
    git push &> $TTT_FOLDER/.tpr-pushed
    cat $TTT_FOLDER/.tpr-pushed
    rejected=$(cat $TTT_FOLDER/.tpr-pushed | grep "rejected" | tail -n 1 | wc -l)
    rm $TTT_FOLDER/.tpr-pushed
    if [ $rejected -eq 1 ]; then
        touch $TTT_FOLDER/.tpr-push-rejected
        return 1
    else
        return 0
    fi
}
function rebase() {
    echo "tpr -> rebase"
    git pull --rebase 
    conflict=$(git status | grep "both modified" | tail -n 1 | wc -l)
    if [ $conflict -eq 1 ]; then
        git rebase --abort
        echo "discarding commit:"
        git show HEAD
        git reset --hard HEAD~1
        git pull
    fi
    if [ -f $TTT_FOLDER/.tpr-push-rejected ]; then
        touch $TTT_FOLDER/.tpr-push-rejected-rebase-complete
    fi
}

function tpr() {
    cd $TTT_REPO    
    tcr && push || rebase
}
