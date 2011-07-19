#!/bin/sh -x

# (1,B=T),Ad,B1,Ad->Td,Td->B1

sh task-1.sh

if [ -d repob ]; then
  rm -fr repob
fi
hg clone repom repob

cd repoa
  hg rm hello.rb
  hg commit -m "removed hello.rb from branch-a"
cd ..
cd repob
  sed -i "s/hello world/hello mundo/g" hello.rb
  hg commit -m "changed to hello mundo"
cd ..
cd repom
  hg pull ../repoa
  hg update tip
cd ..
cd repob
  hg pull ../repom
  hg update tip
cd ..


