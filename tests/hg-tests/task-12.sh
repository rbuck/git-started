#!/bin/sh

# (1,B=T),A1,Bm,B2->T1,T1->A2

# create master
if [ -d repom ]; then
  rm -fr repom
fi
mkdir repom
cd repom
  hg init
  mkdir one
  cp ../hello.rb one/hello.rb
  hg add one/hello.rb
  hg commit -m "initial repository"
cd ..

# clone to 'a'
if [ -d repoa ]; then
  rm -fr repoa
fi
hg clone repom repoa

# clone to 'b'
if [ -d repob ]; then
  rm -fr repob
fi
hg clone repom repob

cd repoa
  sed -i "s/hello world/hello mundo/g" one/hello.rb
  # no need to add
  hg commit -m "changed to hello mundo"
cd ..
cd repob
  hg mv one/ two/
  hg commit -m "refactored"
cd ..
cd repom
  hg pull ../repob
  hg update tip
cd ..
cd repoa
  hg pull ../repom
  hg update tip
cd ..

