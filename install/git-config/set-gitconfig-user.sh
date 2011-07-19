#!/bin/bash

function usage {
  echo >&2 "usage: $0 [-e email] [-u name]\n"
  exit 1
}

while [ $# -gt 0 ]
do
  case "$1" in
    -e) shift; email=$1;;
    -u) shift; name=$1;;
    *) usage;;
  esac
  shift
done
if [ -z "$email" ]; then
  echo "email address undefined.\n"
  usage
  exit 1
fi
if [ -z "$name" ]; then
  echo "name undefined.\n"
  usage
  exit 1
fi

git config --global user.name "$name"
git config --global user.email $email

