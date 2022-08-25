#!/bin/bash

cd $ABOUT_FOLDER/tpr/will-rebase
rm -rf .git
rm sut.spec.js
rm another-sut.spec.js
rm -rf $ABOUT_FOLDER/tpr/will-rebase/clone
git init
npm install
touch sut.spec.js
git add .
git status
git commit -m sut
git clone . clone
touch another-sut.spec.js
git add another-sut.spec.js
git status
git commit -m another
git checkout -b standby
pwd
git branch
cd $ABOUT_FOLDER/tpr/will-rebase/clone
pwd
git branch
npm install
echo "const { expect } = require('chai');" > sut.spec.js
