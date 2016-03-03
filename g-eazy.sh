#!/bin/bash

echo "Commit message: short and sweat..."
read COMMIT
git add -A
git commit -m "G-EAZY update ... garyalex : $COMMIT"
git push
