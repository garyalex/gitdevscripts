#!/bin/bash
# Summary: wrapper to run gitswatch recursively on sub dirs
# Usage: gitswatch-below.sh /parent/dir/
# Author: Gary Alexander (https://github.com/garyalex)
# Version: 0.0.1

# store the current dir
CUR_DIR=$(pwd)
echo "Git repo checker"
echo

for BELOW in $(ls -1); do 
  STATUS="-    "
  if [ -d "$BELOW" ]; then
    cd "$BELOW"
    if [ -d .git ];then
      STATUS="* git"
    fi
    echo -e "\e[1m\e[36m$STATUS    \e[0m$BELOW"
    cd "$CUR_DIR"
  fi
done
