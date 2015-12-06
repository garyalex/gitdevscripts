#!/usr/bin/env zsh
# Will do a repeated git status in the current dir
# Gary Alexander
# v0.0.2 - Colorful output is coming

CURRENTDIR=`pwd`

if [ -d .git ]; then
  while true
  do
    STATUS=`git status --short --branch` 
    DATE=`date +'%F %R %a'`
    clear
    echo "GITSWATCH" | toilet -F metal -f smblock -t 
    echo
    echo "STATUS"
    echo "$STATUS"
    echo "CURRENTDIR"
    echo "$CURRENTDIR"
    echo "DATE"
    echo "$DATE" 
    if [[ $1 == "single" ]]; then
      exit 0
    else
    sec=60
      while [ $sec -ge 0 ]; do
        echo -ne "COUNTDOWN TO REFRESH: $sec SECS\033[0K\r" 
        let "sec=sec-1"
        sleep 1
      done
    fi
  done
else
  echo "Not a git repo!"
  exit 1
fi
