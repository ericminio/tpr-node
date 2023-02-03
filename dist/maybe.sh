#!/bin/bash

source ./maybe-helper.sh
source ./tdd.sh
source ./tcr.sh
source ./tpr.sh

function run() {
    case $TTT_RUN in
        TPR)
            tpr
            ;;
        TCR)
            tcr
            ;;
        *) 
            tdd
            ;;
    esac
}

if [ $(shouldRun) = "yes" ]; then
    clearControlFiles
    run
    checkpoint
else
    clearControlFiles
    checkpoint
fi
date +%R