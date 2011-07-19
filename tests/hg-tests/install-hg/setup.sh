#!/bin/sh

mkdir tmprepo
cd tmprepo
  hg init
  hg config --global ui.username "Full Name <full.name@company.com>"
cd ..
rm -fr tmprepo

