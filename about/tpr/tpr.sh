#!/bin/bash

source ../tdd.sh
source ../tcr.sh
source ../tpr.sh

function test_push_on_green {
    cd $ABOUT_FOLDER/tpr/will-push
    ./go.sh
    TTT_REPO="$ABOUT_FOLDER/tpr/will-push/clone"
    tpr
    cd $ABOUT_FOLDER/tpr/will-push
    pwd
    git checkout master
    git branch
    git log
    pushed=$(git log -n 1 | grep ttt | tail -n 1 | wc -l)

    assertequals $pushed 1
}

function test_does_not_push_on_red {
    cd $ABOUT_FOLDER/tpr/will-pull-after-revert
    ./go.sh
    TTT_REPO="$ABOUT_FOLDER/tpr/will-pull-after-revert/clone"
    tpr > $ABOUT_FOLDER/tpr/will-pull-after-revert/clone/.tpr-output
    cat $ABOUT_FOLDER/tpr/will-pull-after-revert/clone/.tpr-output
    pushed=$(cat $ABOUT_FOLDER/tpr/will-pull-after-revert/clone/.tpr-output | grep "TPR -> push" | tail -n 1 | wc -l)

    assertequals $pushed 0
}

function test_pull_on_red {
    cd $ABOUT_FOLDER/tpr/will-pull-after-revert
    ./go.sh
    TTT_REPO="$ABOUT_FOLDER/tpr/will-pull-after-revert/clone"
    tpr
    git log
    pulled=$(git log -n 1 | grep exploration | tail -n 1 | wc -l)

    assertequals $pulled 1
}

function test_rebase_on_red {
    $ABOUT_FOLDER/tpr/will-rebase/go.sh
    TTT_REPO="$ABOUT_FOLDER/tpr/will-rebase/clone"
    tpr
    git log
    count=$(git log | grep Author: | wc -l)

    assertequals $count 3
}
