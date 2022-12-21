#!/bin/sh

for dir in *; do
  test -d "$dir/.git" || continue
  (
    cd "$dir"
    git restore -WS .
    git checkout master
    git pull
  ) | sed "s/^/[$dir] /" &
done
