#!/bin/bash

if [ ! -f $1 ]; then
  if [ ! -d "$1" ]; then
    echo "Specify file or dir"
    exit 1
  else
    rm -ri "$1"
    git rm "$1"
    exit 0
  fi
  rm -ri "$1"
  git rm "$1"
fi 

git status
