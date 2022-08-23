#!/bin/bash

rm -rf .git
rm will-push.spec.js
rm -rf $ABOUT_FOLDER/will-push/clone
git init
npm install
touch will-push.spec.js
git add .
git status
git commit -m init
git clone . clone
git checkout -b standby
pwd
git branch
cd $ABOUT_FOLDER/will-push/clone
pwd
git branch
npm install
echo "const { expect } = require('chai');" > will-push.spec.js
