#!/bin/bash
# Summary: Update all git repos in a directory and subdirectories
# Gary Alexander (https://github.com/garyalex)

if [ $# -ne 1 ]; then
        echo "Usage: $0 /path/to/repo"
        echo "This will update the main repo and all sub directories"
        echo 
        exit 1
fi

UPDATEDIR="$1"

# check if it is valid

[ -d "$UPDATEDIR" ] || { echo "Error: Directory $UPDATEDIR does not exist."; exit 1; }

# store the current dir
CUR_DIR=$(pwd)

# Let the person running the script know what's going on.
echo "Pulling in latest changes for all repositories..."

# Find all git repositories and update it to the master latest revision
for i in $(find . -name ".git" | cut -c 3-); do
    echo "";

    # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;
    echo "$(pwd)"

    # finally pull
    git pull origin master;

    # lets get back to the CUR_DIR
    cd $CUR_DIR
done

echo "========"
echo "Complete"
