#!/bin/bash

source ./tpr.sh

function run() {
    rm $TTT_FOLDER/.ptr-*
    tpr
}

cd $TTT_REPO
clean=$(git status | grep "nothing to commit" | wc -l)

if [ $clean -eq 0 ]; then
    run
else
    if [ -f $TTT_FOLDER/.ptr-push-rejected-rebase-complete ]; then
        run
    else
        echo "tpr -> exit"
        exit 0
    fi
fi

