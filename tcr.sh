#!/bin/bash

function commit() {
    echo "TCR -> commit"
    clean=$(git status | grep "nothing to commit" | wc -l)
    if [ $clean -eq 1 ]; then
        echo "nothing to commit"
        return 0
    else
        git add .
        git commit -m ttt
    fi
}
function revert() {
    echo "TCR -> revert"
    clean=$(git status | grep "nothing to commit" | wc -l)
    if [ $clean -eq 1 ]; then
        echo "discarding commit:"
        git show HEAD        
        git reset --hard HEAD~1
    else
        git reset --hard
    fi
}

function tcr() {
    cd $TTT_REPO
    test && commit || revert
}
