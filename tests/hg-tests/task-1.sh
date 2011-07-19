#!/bin/sh -x

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
if [ -d repoa ]; then
  rm -fr repoa
fi
hg clone repom repoa

