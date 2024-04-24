#!/bin/bash

cd $ABOUT_FOLDER/tpr/will-pull-after-revert
rm -rf .git
rm will-pull.test.js
rm -rf $ABOUT_FOLDER/tpr/will-pull-after-revert/clone
git init -b main
npm install
touch will-pull.test.js
git add .
git status
git commit -m init
git clone . clone
echo "import { strict as assert } from 'node:assert';" > will-pull.test.js
git commit -am exploration
git checkout -b standby
pwd
git branch
cd $ABOUT_FOLDER/tpr/will-pull-after-revert/clone
pwd
git branch
npm install
echo "import { strict as assert } from 'unknown';" > will-pull.test.js