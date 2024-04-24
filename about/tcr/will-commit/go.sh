#!/bin/bash

rm -rf .git
rm will-commit.test.js
git init -b main
npm install
git add .
git status
git commit -m init
touch will-commit.test.js
