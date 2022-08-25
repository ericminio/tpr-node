#!/bin/bash

function clearControlFiles() {
    cd $TTT_REPO
    rm .tpr-*
}

function checksum() {
    git diff
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

function shouldRerun() {
    echo "no"
}
