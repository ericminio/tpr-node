#!/bin/bash

cd $ABOUT_FOLDER/tpr/will-prevent-conflict
rm -rf .git
rm sut.spec.js
rm -rf $ABOUT_FOLDER/tpr/will-prevent-conflict/clone
git init
npm install
touch sut.spec.js
git add .
git status
git commit -m init
git clone . clone
echo "const { expect } = require('chai');" > sut.spec.js
git commit -am challenge
git checkout -b standby
pwd
git branch
cd $ABOUT_FOLDER/tpr/will-prevent-conflict/clone
pwd
git branch
npm install
echo "const chai = require('chai');" > sut.spec.js
