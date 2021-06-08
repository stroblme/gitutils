#!/bin/bash

git add ./

message=""
for var in "$@"
do
message="$message$var "
done

git commit -m "$message"
git pushh
git logg
