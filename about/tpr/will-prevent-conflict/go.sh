#!/bin/bash

cd $ABOUT_FOLDER/tpr/will-prevent-conflict
rm -rf .git
rm sut.test.js
rm -rf $ABOUT_FOLDER/tpr/will-prevent-conflict/clone
git init -b main
npm install
touch sut.test.js
git add .
git status
git commit -m init
git clone . clone
echo "import { strict as assert } from 'node:assert';" > sut.test.js
git commit -am challenge
git checkout -b standby
pwd
git branch
cd $ABOUT_FOLDER/tpr/will-prevent-conflict/clone
pwd
git branch
npm install
echo "import { describe, it } from 'node:test';" > sut.test.js
