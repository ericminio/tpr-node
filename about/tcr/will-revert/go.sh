#!/bin/bash

cd $ABOUT_FOLDER/tcr/will-revert
rm -rf .git
git init -b main
npm install
git add .
git status
git commit -m init
echo "syntax error" >> sut.spec.js
