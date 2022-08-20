#!/bin/bash

function test() {
    echo "TDD -> test"
    npm test    
}
function tdd() {
    cd $TTT_REPO
    test
}
