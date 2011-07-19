#!/bin/sh

# (1,B=T),Ad,Bd,Ad->Td,Td->Bd

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
  hg rm hello.rb
  hg commit -m "removed hello.rb from branch-b"
cd ..
cd repom
  hg pull ../repoa
  hg update tip
cd ..
cd repob
  hg pull ../repom
  hg update tip
cd ..

