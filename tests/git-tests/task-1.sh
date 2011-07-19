#!/bin/sh -x

if [ -d hello.git ]; then
  rm -fr hello.git
fi
mkdir hello.git
cd hello.git
  git init
  cp ../hello.rb .
  git add hello.rb
  git commit -m "initial repository"
  git branch branch-a
cd ..

