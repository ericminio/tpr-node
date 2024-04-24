#!/bin/bash

cd $ABOUT_FOLDER/tpr/will-rebase
rm -rf .git
rm sut.test.js
rm another-sut.test.js
rm -rf $ABOUT_FOLDER/tpr/will-rebase/clone
git init -b main
npm install
touch sut.test.js
git add .
git status
git commit -m sut
git clone . clone
touch another-sut.test.js
git add another-sut.test.js
git status
git commit -m another
git checkout -b standby
pwd
git branch
cd $ABOUT_FOLDER/tpr/will-rebase/clone
pwd
git branch
npm install
echo "import { strict as assert } from 'node:assert';" > sut.test.js
