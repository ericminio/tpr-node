#!/bin/bash

source ./dir.sh
DIR=$(current_dir ${BASH_SOURCE[0]})

if [ -f "$DIR/conflict" ]; then
    echo "fs event from temporary conflict -> exit"
    rm $DIR/conflict
    exit 0
else
    ./tpr.sh
fi
