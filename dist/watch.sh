#!/bin/bash
clear
./check-env.sh

source ./maybe-helper.sh

function current_dir {
    echo $( cd "$( dirname "$1" )" >/dev/null 2>&1 && pwd )    
}

DIR=$(current_dir ${BASH_SOURCE[0]})

cd $TTT_REPO
clearControlFiles
source ~/.nvm/nvm.sh
nvm use
git pull
git status
checkpoint

cd $DIR
fswatch -o -r $TTT_FOLDER | xargs -n1 ./maybe.sh
