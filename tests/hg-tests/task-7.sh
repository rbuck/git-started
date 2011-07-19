#!/bin/sh

#        (1,B=T),A1,A1->T1,B1,T1->B1
#        (1,B=T),A1,A1->T1,B1,B1->T1


sh task-1.sh
if [ -d repob ]; then
  rm -fr repob
fi
hg clone repom repob

cd repoa
  sed -i "s/hello world/hello mundo/g" hello.rb
  hg commit -m "changed to hello mundo"
cd ..
cd repom
  hg pull ../repoa
  hg update tip
cd ..
cd repob
  sed -i "s/hello world/hola world/g" hello.rb
  hg commit -m "changed to hola world"
  #hg pull ../repom
  #hg resolve # as compared to git mergetool
  #hg commit -m "merged on b"
cd ..

