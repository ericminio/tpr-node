#!/bin/bash

source ./dir.sh
DIR=$(current_dir ${BASH_SOURCE[0]})

source /usr/local/opt/nvm/nvm.sh
cd $TCR_REPO
nvm use

cd $DIR

./tpr.sh
fswatch $TCR_FOLDER | xargs -n1 ./tpr.sh
