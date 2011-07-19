#!/bin/sh

# (1,B=T),A1,A1->T1,T1->B1

sh task-1.sh

if [ -d repob ]; then
  rm -fr repob
fi
hg clone repom repob

cd repoa
  sed -i "s/hello world/hello mundo/g" hello.rb
  # hg add hello.rb
  hg commit -m "changed to hello mundo"
cd ..
cd repom
  hg pull ../repoa
  hg update tip
  # hg commit -m "merged from repo-a"
cd ..
cd repob
  hg pull ../repom
  hg update tip
  # hg commit -m "merged from master"
cd ..

