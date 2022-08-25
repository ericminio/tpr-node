#!/bin/bash

rm -rf .git
rm will-pull.spec.js
rm -rf $ABOUT_FOLDER/tpr/will-pull-after-revert/clone
git init
npm install
touch will-pull.spec.js
git add .
git status
git commit -m init
git clone . clone
echo "const { expect } = require('chai');" > will-pull.spec.js
git commit -am exploration
git checkout -b standby
pwd
git branch
cd $ABOUT_FOLDER/tpr/will-pull-after-revert/clone
pwd
git branch
npm install
echo "const { expect } = require('unknown');" > will-pull.spec.js
