#!/bin/sh

# (1,B=T),A1,A1->B1,A2,A2->T1,T1->B2,B2->T2

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
cd repoa
  sed -i "s/hello mundo/hola mundo/g" hello.rb
  # no add needed
  hg commit -m "changed to hola mundo"
cd ..
cd repom
  hg pull ../repoa
  hg update tip
cd ..
cd repob
  hg pull ../repom
  hg update tip
cd ..
cd repom
  hg pull ../repob
  hg update tip
cd ..

