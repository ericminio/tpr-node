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

if [ $(rebaseConflicted) = "yes" ]; then
    clearControlFiles
    checkpoint
    exit 0
fi

if [ $(rebaseSuccessed) = "yes" ]; then
    clearControlFiles
    run
    checkpoint
    exit 0
fi

if [ $(hasChecksumChanged) -eq 0 ]; then
    echo "$TTT_RUN -> no change -> exit"
    clearControlFiles
    checkpoint
else
    clearControlFiles
    run
    checkpoint
fi
