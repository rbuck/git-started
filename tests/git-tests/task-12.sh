#!/bin/sh

if [ -d hello.git ]; then
  rm -fr hello.git
fi

mkdir hello.git
cd hello.git
  git init
  mkdir one
  cp ../hello.rb one/hello.rb
  git add one/hello.rb
  git commit -m "initial repository"

  git branch branch-a
  git branch branch-b

  git checkout branch-a
  sed -i "s/hello world/hello mundo/g" one/hello.rb
  git add one/hello.rb
  git commit -m "changed to hello mundo"

  git checkout branch-b
  git mv one/ two/
  git commit -m "refactored"
  git checkout master
  git merge branch-b
  git checkout branch-a
  git merge master
cd ..

