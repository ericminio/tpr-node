#!/bin/bash

source ../tcr.sh

function test_commit_on_green {
    cd $ABOUT_FOLDER/will-pass
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

function test_revert_on_red {
    cd $ABOUT_FOLDER/will-fail
    rm -rf .git
    git init
    npm install
    git add .
    git status
    git commit -m init
    echo "syntax error" >> sut.spec.js
    TTT_REPO="$DIR/will-fail"
    tcr
    cat sut.spec.js
    modification=$(cat sut.spec.js | grep "syntax error" | tail -n 1 | wc -l)

    assertequals $modification 0
}