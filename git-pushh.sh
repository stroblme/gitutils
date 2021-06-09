#!/bin/bash

branches=$(git branch)
branch=$( echo ${branches:1} | sed 's/[^a-zA-Z0-9]//g' )
echo "Current branch is $branch"

if [ -z "$1" ];
then
    remotes=$(git remote)
    count=$( echo ${remotes} | wc -w )
    if [ $count -gt 1 ];
    then
        for remote in $remotes
        do
            PS3="Shall I push to remote $remote "
            select ync in "Yes" "No" "Cancel";
            do
                case $ync in
                    "Yes") 
                        git push --set-upstream $remote $branch
                        break
                        ;;
                    "No") 
                        echo "Skipping"
                        break
                        ;;
                    "Cancel") 
                        echo "Quit"
                        exit
                        ;;
                esac
            done
        done
    else
        remote=$( echo ${remotes} | head -1 )
        echo push to $remote
        git push --set-upstream $remote $branch
    fi
else
    echo "Will push to remote $1"
    git push --set-upstream $1 $branch
fi