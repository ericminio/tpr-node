#!/bin/bash

rm -rf .git
rm will-pass.spec.js
git init
npm install
git add .
git status
git commit -m init
touch will-pass.spec.js
