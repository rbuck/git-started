#!/bin/sh

# (4),B1->T1

sh task-4.sh

cd repom
  hg pull ../repob
  hg update tip
  # hg commit -m "merged from master"
cd ..

