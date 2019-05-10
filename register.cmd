@echo off
setlocal enabledelayedexpansion

for /r . %%f in (git-*.cmd) do (
    set path=%%~sf 

    set alias=%%~nf

    git config --global alias.!alias! "!path!"
)