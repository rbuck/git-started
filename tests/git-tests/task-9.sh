#!/bin/sh

sh task-1.sh

cd hello.git
  git branch branch-b
  git checkout branch-a
  git rm hello.rb
  git commit -m "removed hello.rb from branch-a"
  git checkout branch-b
  sed -i "s/hello world/hello mundo/g" hello.rb
  git add hello.rb
  git commit -m "changed to hello mundo"
  git checkout master
  git merge branch-a
  git checkout branch-b
  git merge master
cd ..

