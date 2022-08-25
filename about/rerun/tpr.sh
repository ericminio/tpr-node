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