#!/bin/bash

source ../tdd.sh
source ../tcr.sh
source ../maybe-helper.sh

function test_does_not_rerun_after_revert {
    $ABOUT_FOLDER/tcr/will-revert/go.sh
    TTT_REPO="$ABOUT_FOLDER/tcr/will-revert"
    tcr
    should=$(shouldRerun)

    assertequals $should "no"
}