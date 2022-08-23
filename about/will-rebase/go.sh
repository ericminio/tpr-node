#!/bin/bash

rm -rf .git
rm will-rebase.spec.js
rm -rf $ABOUT_FOLDER/will-rebase/clone
git init
npm install
touch will-rebase.spec.js
git add .
git status
git commit -m init
git clone . clone
echo "const { expect } = require('chai');" > will-rebase.spec.js
git commit -am exploration
git checkout -b standby
pwd
git branch
cd $ABOUT_FOLDER/will-rebase/clone
pwd
git branch
npm install
echo "const { expect } = require('unknown');" > will-rebase.spec.js
