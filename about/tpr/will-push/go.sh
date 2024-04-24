#!/bin/bash

rm -rf .git
rm will-push.test.js
rm -rf $ABOUT_FOLDER/tpr/will-push/clone
git init -b main
npm install
touch will-push.test.js
git add .
git status
git commit -m init
git clone . clone
git checkout -b standby
pwd
git branch
cd $ABOUT_FOLDER/tpr/will-push/clone
pwd
git branch
npm install
echo "import { strict as assert } from 'node:assert';" > will-push.test.js
