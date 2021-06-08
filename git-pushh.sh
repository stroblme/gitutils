#!/bin/bash

# branch=$(git branch)
branch=$(echo $(git branch) | sed 's/[^a-zA-Z0-9]//g')

echo "Current branch is $branch"

if [ -z "$1" ];
then
    remotes=$(git remote)
    count=$(echo $remotes | wc -l)


    if [ $count -gt 1 ];
    then
        for remote in $remotes
        do
            echo "Shall I push to remote $remote"
            select ync in "Y" "n" "c"; do
                case $ync in
                    Y ) git push --set-upstream $remote $branch; break;;
                    n ) echo "Skipping"; break;;
                    c ) exit;;
                esac
            done
        done
    else
        remote=$(echo $remotes | head -1)
        git push --set-upstream $remote $branch
    fi
else
    echo "Will push to remote $1"
    git push --set-upstream $1 $branch
fi