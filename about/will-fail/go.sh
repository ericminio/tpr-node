#!/bin/bash

rm -rf .git
git init
npm install
git add .
git status
git commit -m init
echo "syntax error" >> sut.spec.js
