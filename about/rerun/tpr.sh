#!/bin/bash

source ../tdd.sh
source ../tcr.sh
source ../tpr.sh
source ../maybe-helper.sh

function test_does_not_rerun_after_revert_and_pull {
    $ABOUT_FOLDER/tpr/will-pull-after-revert/go.sh
    TTT_REPO="$ABOUT_FOLDER/tpr/will-pull-after-revert/clone"
    tpr
    should=$(shouldRerun)

    assertequals $should "no"
}

function test_does_rerun_after_rebase {
    $ABOUT_FOLDER/tpr/will-rebase/go.sh
    TTT_REPO="$ABOUT_FOLDER/tpr/will-rebase/clone"
    tpr
    should=$(shouldRerun)

    assertequals $should "yes"
}

function test_does_not_rerun_after_prevented_conflict {
    $ABOUT_FOLDER/tpr/will-prevent-conflict/go.sh
    TTT_REPO="$ABOUT_FOLDER/tpr/will-prevent-conflict/clone"
    tpr
    should=$(shouldRerun)

    assertequals $should "no"
}