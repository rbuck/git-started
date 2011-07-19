#!/bin/sh -x

sh task-1.sh

cd hello.git
  git branch branch-b
  git checkout branch-a
  sed -i "s/hello world/hello mundo/g" hello.rb
  git add hello.rb
  git commit -m "changed to hello mundo"
  git checkout branch-b
  git mv hello.rb hola.rb
  git commit -m "refactored"
  git checkout master
  git merge branch-b
  git checkout branch-a
  git merge master
cd ..

