#!/bin/sh -x

sh task-1.sh

cd hello.git
  git checkout master
  sed -i "s/hello world/hola world/g" hello.rb
  git add hello.rb
  git commit -m "changed to hola world"
  git checkout branch-a
  git merge master
cd ..
