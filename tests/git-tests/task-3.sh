#!/bin/sh -x

sh task-1.sh

cd hello.git
  git checkout branch-a
  sed -i "s/hello world/hello mundo/g" hello.rb
  git add hello.rb
  git commit -m "changed to hello mundo"
  git checkout master
  git merge branch-a
cd ..
