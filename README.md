# Script Collection for the git cmd interface

A collection of various helpfully git cmd line extensions.
A detailed description follows soon

## Register the files the classic way

1. Clone to your local git path (e.g. C:\Program Files\Git\cmd) specified in the environment path variable
2. git config --global alias.NEWCOMMAND "!C:\\PROGRA~1\\Git\\cmd\\git-NEWCOMMAND.cmd"

## Let a script do all the stuff

Warning: This will register all files matching the following regex: git-*.cmd as new git commands. This is normally safe but provides a leak of security.