#!/usr/bin/env zsh
# Summary: wrapper to run gitswatch recursively on sub dirs
# Usage: gitswatch-below.sh /parent/dir/
# Author: Gary Alexander (https://github.com/garyalex)
# Version: 0.0.1

autoload colors
if [[ "$terminfo[colors]" -gt 8 ]]; then
  colors
fi
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
  eval $COLOR='$fg_no_bold[${(L)COLOR}]'
  eval BOLD_$COLOR='$fg_bold[${(L)COLOR}]'
done
eval RESET='$reset_color'

# store the current dir
CUR_DIR=$(pwd)

# Find all git repositories and update it to the master latest revision
for i in $(find . -name ".git" | cut -c 3-); do
    echo "";
    echo "$YELLOW"+$i+"$RESET";

    # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;

    # Run gitswatch here
    gitswatch single;
    sleep 5

    # lets get back to the CUR_DIR
    cd $CUR_DIR
done

