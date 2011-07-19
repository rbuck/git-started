#!/bin/sh

# (1,B=T),A1,Bm,B2->T1,T1->A2

# create master
if [ -d repom ]; then
  rm -fr repom
fi
mkdir repom
cd repom
  hg init
  cp ../hello.rb .
  hg add hello.rb
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
  sed -i "s/hello world/hello mundo/g" hello.rb
  # no need to add
  hg commit -m "changed to hello mundo"
cd ..
cd repob
  hg mv hello.rb hola.rb
  hg commit -m "refactored"
cd ..
cd repom
  hg pull ../repoa
  hg update tip
cd ..
cd repob
  hg pull ../repom
  hg update tip
  hg merge
  hg commit -m "merged filerename"
cd ..

