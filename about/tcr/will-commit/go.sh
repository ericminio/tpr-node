#!/bin/bash

rm -rf .git
rm will-commit.spec.js
git init -b main
npm install
git add .
git status
git commit -m init
touch will-commit.spec.js
