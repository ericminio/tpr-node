#!/bin/bash

function push() {
    echo "tpr -> push"
    git push
}
function rebase() {
    echo "tpr -> rebase"
    failed=$(git pull --rebase | grep CONFLICT | tail -n 1 | wc -l)
    if [ $failed = 1 ]; then
        echo "CONFLICT"
        git rebase --abort
        echo "discarding following commit:"
        git show HEAD
        git reset --hard HEAD~1
        git pull
    fi
}

echo "tpr <- $1"

./tcr.sh

cd $TCR_REPO
push || rebase