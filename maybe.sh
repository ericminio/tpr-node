#!/bin/bash

source ./checksum.sh
source ./tdd.sh
source ./tcr.sh
source ./tpr.sh

if [ $(hasChecksumChanged) -eq 0 ]; then
    echo "$TTT_RUN -> no change -> exit"
    cleanChecksums
    checkpoint
    exit 0
fi
cleanChecksums

function run() {
    rm $TTT_FOLDER/.tpr-*
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

cd $TTT_REPO
clean=$(git status | grep "nothing to commit" | wc -l)

if [ $clean -eq 0 ]; then
    run
else
    if [ -f $TTT_FOLDER/.tpr-push-rejected-rebase-complete ]; then
        run
    else
        echo "$TTT_RUN -> exit"
    fi
fi

checkpoint