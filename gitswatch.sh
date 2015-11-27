#!/bin/zsh
# Will do a repeated git status in the current dir
# Colorful output via spectrum
autoload spectrum && spectrum

while true
do
  echo "GITSWATCH" | toilet -F gay -f pagga -t
  git status --short --branch
  sleep 60
done
