#!/bin/bash

source ../dir.sh
source ../tcr.sh

function test_commit_on_green {
    DIR=$(current_dir ${BASH_SOURCE[0]})
    cd $DIR/will-pass
    rm -rf .git
    rm will-pass.spec.js
    git init
    npm install
    git add .
    git status
    git commit -m init
    touch will-pass.spec.js
    TTT_REPO="$DIR/will-pass"
    tcr
    committed=$(git log | grep ttt | tail -n 1 | wc -l)

    assertequals $committed 1
}
