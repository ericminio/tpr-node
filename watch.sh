#!/bin/bash

source ./dir.sh
DIR=$(current_dir ${BASH_SOURCE[0]})

source /usr/local/opt/nvm/nvm.sh
cd $TTT_REPO
nvm use

cd $DIR

./tpr.sh
fswatch -r $TTT_FOLDER | xargs -n1 ./tpr.sh
