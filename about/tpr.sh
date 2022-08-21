#!/bin/bash

source ../tdd.sh
source ../tcr.sh
source ../tpr.sh

function test_push_on_green {
    cd $ABOUT_FOLDER/will-push
    rm -rf .git
    rm will-push.spec.js
    rm -rf $ABOUT_FOLDER/will-push/clone
    git init
    npm install
    touch will-push.spec.js
    git add .
    git status
    git commit -m init
    git clone . clone
    git checkout -b standby
    pwd
    git branch
    cd $ABOUT_FOLDER/will-push/clone
    pwd
    git branch
    npm install
    echo "const { expect } = require('chai');" > will-push.spec.js
    TTT_REPO="$ABOUT_FOLDER/will-push/clone"
    tpr
    cd $ABOUT_FOLDER/will-push
    pwd
    git checkout master
    git branch
    git log
    pushed=$(git log -n 1 | grep ttt | tail -n 1 | wc -l)

    assertequals $pushed 1
}
