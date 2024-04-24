#!/bin/bash

source ../dist/tdd.sh
source ../dist/tcr.sh

function test_commit_on_green {
    cd $ABOUT_FOLDER/tcr/will-commit
    ./go.sh
    TTT_REPO="$ABOUT_FOLDER/tcr/will-commit"
    tcr
    committed=$(git log | grep ttt | tail -n 1 | wc -l)

    assertequals $committed 1
}

function test_revert_on_red {
    cd $ABOUT_FOLDER/tcr/will-revert
    ./go.sh
    TTT_REPO="$ABOUT_FOLDER/tcr/will-revert"
    tcr
    cat sut.test.js
    modification=$(cat sut.test.js | grep "syntax error" | tail -n 1 | wc -l)

    assertequals $modification 0
}