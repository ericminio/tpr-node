#!/bin/bash

source ../dist/tdd.sh
source ../dist/tcr.sh
source ../dist/maybe-helper.sh

function test_does_not_run_after_revert {
    $ABOUT_FOLDER/tcr/will-revert/go.sh
    TTT_REPO="$ABOUT_FOLDER/tcr/will-revert"
    tcr
    should=$(shouldRun)

    assertequals $should "no"
}