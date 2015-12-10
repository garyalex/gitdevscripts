#!/usr/bin/env zsh
# Summary: wrapper to run gitswatch recursively on sub dirs
# Usage: gitswatch-below.sh /parent/dir/
# Author: Gary Alexander (https://github.com/garyalex)
# Version: 0.0.1

# store the current dir
CUR_DIR=$(pwd)

while true;
do
  for BELOW in $(ls -1); 
  do 
    if [ -d "$BELOW" ]; 
    then
      echo 
      cd $BELOW
      gitswatch single
      sleep 15
      cd $CUR_DIR
    fi
  done
done
