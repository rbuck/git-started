#!/bin/sh -x

# (1),T1,T1->A1

sh task-1.sh

cd repom
  sed -i "s/hello world/hola world/g" hello.rb
  # hg add hello.rb ; hello.rb already tracked; you don't need to explicitly add after an update
  hg commit -m "changed to hola world"
cd ..
cd repoa
  hg pull ../repom
  hg update tip
  # hg commit -m "merged from master" ; nothing to commit, no need to commit an update
cd ..

# Opinion: There is a question about when to use merge vs when to use update; the dichotomy is a
#          bit confusing; git only has merge.

