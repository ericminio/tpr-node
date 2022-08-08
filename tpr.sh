#!/bin/bash

function push() {
    echo "tpr -> push"
    git push
}
function rebase() {
    echo "tpr -> rebase"
    git pull --rebase 
    conflict=$(git status | grep "both modified" | tail -n 1 | wc -l)
    if [ $conflict = 1 ]; then
        echo "CONFLICT"
        git rebase --abort
        echo "discarding commit:"
        git show HEAD
        git reset --hard HEAD~1
        git pull
    fi
}

echo "tpr <- $1"

./tcr.sh

cd $TTT_REPO
push || rebase