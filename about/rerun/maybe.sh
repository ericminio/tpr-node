#!/bin/bash

source ../dist/maybe-helper.sh

function cleanPlayground() {
    cd $ABOUT_FOLDER/rerun/maybe-playground
    rm sut.test.js
    rm -rf .git
    git init -b main
    git add .
    git commit -m start
}

function test_when_something_changed {
    cleanPlayground
    TTT_REPO="$ABOUT_FOLDER/rerun/maybe-playground"
    checkpoint
    cd $ABOUT_FOLDER/rerun/maybe-playground
    touch sut.test.js
    should=$(shouldRun)

    assertequals $should "yes"
}

function test_when_nothing_changed {
    cleanPlayground
    TTT_REPO="$ABOUT_FOLDER/rerun/maybe-playground"
    checkpoint
    should=$(shouldRun)

    assertequals $should "no"
}