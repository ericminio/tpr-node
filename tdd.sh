#!/bin/bash

function test() {
    echo "tdd -> test"
    npm test    
}
function tdd() {
    cd $TTT_REPO
    test
}
