#!/bin/bash

function go {
    clear
    source /usr/local/opt/nvm/nvm.sh
    nvm use
    ./support/test.sh ./tcr/tcr.sh
    ./support/test.sh ./tpr/tpr.sh
    ./support/test.sh ./rerun/tcr.sh
    ./support/test.sh ./rerun/tpr.sh
    ./support/test.sh ./rerun/maybe.sh
}

FILE=${BASH_SOURCE[0]}

if [ $FILE != "./run.sh" ]; then
    echo "run from folder about"
    exit 1
else
    export ABOUT_FOLDER=$(pwd)
    go
fi