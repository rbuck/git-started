#!/bin/sh

# (1,B=T),A1,A1->B1,A1->T1,B1->T1'

sh task-1.sh

if [ -d repob ]; then
  rm -fr repob
fi
hg clone repom repob

cd repoa
  sed -i "s/hello world/hello mundo/g" hello.rb
  # no add needed
  hg commit -m "changed to hello mundo"
cd ..
cd repob
  hg pull ../repoa
  hg update tip
cd ..
cd repom
  hg pull ../repoa
  hg update tip
  hg pull ../repob
  hg update tip
cd ..

