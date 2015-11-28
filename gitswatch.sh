#!/bin/bash
# Will do a repeated git status in the current dir
# Colorful output is coming
MYINSTALLDIR="/home/gta/Documents/scripting/src-gta/gitdevscripts"
. "$MYINSTALLDIR/lib/colorecho/dist/ColorEcho.bash"

CURRENTDIR=`pwd`
TMPFILE="/tmp/gitswatch.$$"

if [ -d .git ]; then
  while true
  do
    STATUS=`git status --short --branch` 
    DATE=`date +'%F %R %a'`
    clear
    echo "GITSWATCH" | toilet -F gay -f smblock -t 
    echo
    echo.BoldYellow "STATUS"
    echo.LightGreen "$STATUS"
    echo.BoldYellow "CURRENTDIR"
    echo.LightGreen "$CURRENTDIR"
    echo.BoldYellow "DATE"
    echo.LightGreen "$DATE" 
    sec=60
    while [ $sec -ge 0 ]; do
      echo -ne "COUNTDOWN TO REFRESH: $sec SECS\033[0K\r" 
      let "sec=sec-1"
      sleep 1
    done
  done
else
  echo "Not a git repo!"
  exit 1
fi
