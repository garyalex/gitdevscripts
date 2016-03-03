#!/usr/bin/env zsh
# Will do a repeated git status in the current dir
# Gary Alexander
# v0.0.2 - Colorful output is coming

# Setup colors for terminal
autoload colors
if [[ "$terminfo[colors]" -gt 8 ]]; then
  colors
fi
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
  eval $COLOR='$fg_no_bold[${(L)COLOR}]'
  eval BOLD_$COLOR='$fg_bold[${(L)COLOR}]'
done
eval RESET='$reset_color'

CURRENTDIR=`pwd`

if [ -d .git ]; then
  while true
  do
    PROJECT=`pwd | awk 'BEGIN { FS = "/" } ; { print $NF; }'`
    STATUS=`git status --short --branch` 
    DATE=`date +'%F %R %a'`
    clear
    echo "$RED"
    echo "$PROJECT" | toilet -f smblock -t 
    # echo "$PROJECT" | figlet -c -o -s -t
    echo
    echo "$BOLD_GREEN DATE: $DATE $RESET" 
    echo "$BOLD_CYAN STATUS:$YELLOW"
    echo "$STATUS"
    echo "$RESET"
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
fi
