#!/bin/bash

function clearControlFiles() {
    cd $TTT_REPO
    rm .tpr-*
}

function checksum() {
    git status && git diff
}

function checkpoint() {
    cd $TTT_REPO
    checksum > .tpr-checksum
}

function hasChecksumChanged() {
    cd $TTT_REPO
    checksum > .tpr-checksum-maybe-different
    diff .tpr-checksum .tpr-checksum-maybe-different | wc -l
}

function rebaseSuccessed() {
    if [ -f $TTT_REPO/.tpr-rebase-successful ]; then
        echo "yes"
    else
        echo "no"
    fi
}

function rebaseConflicted() {
    if [ -f $TTT_REPO/.tpr-rebase-conflicted ]; then
        echo "yes"
    else
        echo "no"
    fi
}

function revertHappened() {
    if [ -f $TTT_REPO/.tpr-reverted ]; then
        echo "yes"
    else
        echo "no"
    fi
}

function shouldRun() {
    if [ $(revertHappened) = "yes" ]; then
        echo "no"
        return 0
    fi
    if [ $(rebaseSuccessed) = "yes" ]; then
        echo "yes"
        return 0
    fi
    if [ $(hasChecksumChanged) -ne 0 ]; then
        echo "yes"
        return 0
    fi
    echo "no"
}
