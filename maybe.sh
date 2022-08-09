#!/bin/bash

source ./dir.sh
source ./tpr.sh

DIR=$(current_dir ${BASH_SOURCE[0]})

if [ -f "$TTT_REPO/tpr-skip" ]; then
    echo "tpr -> exit"
    rm $TTT_REPO/tpr-skip
    exit 0
else
    tpr
fi
