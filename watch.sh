#!/bin/bash
clear
./check-env.sh

source ./checksum.sh
source ./dir.sh
source ./tpr.sh

DIR=$(current_dir ${BASH_SOURCE[0]})

source /usr/local/opt/nvm/nvm.sh
cd $TTT_REPO
nvm use
git pull
git status
checkpoint

cd $DIR
fswatch -o -r $TTT_FOLDER | xargs -n1 ./maybe.sh
