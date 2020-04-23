#!/bin/sh

REMOTES=$(git branch -r --format="%(refname)" | cut -f4- -d/)
for branch in $(git branch); do
    REMOTE=$(git config branch.$branch.remote)
    if [ -n "$REMOTE" ] && ! grep "^$branch$" <<< "$REMOTES" > /dev/null; then
        echo $branch;
    fi
done
