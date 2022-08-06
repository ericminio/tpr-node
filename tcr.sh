#!/bin/bash

function test() {
    echo "tcr -> test"
    npm test
}
function commit() {
    echo "tcr -> commit"
    git add .
    git commit -m tcr
}
function revert() {
    echo "tcr -> revert"
    git reset --hard
}

cd $TCR_REPO

test && commit || revert