#!/bin/bash

function go {
    clear
    source ~/.nvm/nvm.sh
    nvm use
    testing ./tcr/tcr.sh
    testing ./tpr/tpr.sh
    testing ./rerun/tcr.sh
    testing ./rerun/tpr.sh
    testing ./rerun/maybe.sh
}

function testing {
    ./support/test.sh $1
    if (( $? != 0 )); then
        exit 1
    fi
}

FILE=${BASH_SOURCE[0]}

if [ $FILE != "./run.sh" ]; then
    echo "run from folder about"
    exit 1
else
    export ABOUT_FOLDER=$(pwd)
    go
fi