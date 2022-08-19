#!/bin/bash

function cleanChecksums() {
    cd $TTT_REPO
    rm .tpr-checksum*
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
