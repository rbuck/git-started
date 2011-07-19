#!/bin/sh -x

# (1),A1,A1->T1

sh task-1.sh

cd repoa
  sed -i "s/hello world/hello mundo/g" hello.rb
  hg add hello.rb
  hg commit -m "changed to hello mundo"
cd ..
cd repom
  hg pull ../repoa
  hg update tip
  # hg commit -m "merged from master"
cd ..

