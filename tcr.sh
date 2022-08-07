#!/bin/bash

function test() {
    echo "tcr -> test"
    npm test    
}
function commit() {
    echo "tcr -> commit"
    clean=$(git status | grep "nothing to commit" | wc -l)
    if [ $clean = 1 ]; then
        echo "nothing to commit"
        return 0
    else
        git add .
        git commit -m tcr
    fi
}
function revert() {
    echo "tcr -> revert"
    clean=$(git status | grep "nothing to commit" | wc -l)
    if [ $clean = 1 ]; then
        echo "discarding commit:"
        git show HEAD        
        git reset --hard HEAD~1
    else
        git reset --hard
    fi
}

cd $TCR_REPO

test && commit || revert