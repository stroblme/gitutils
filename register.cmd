echo Using alternative register method
register_alt.cmd

REM @echo off
REM setlocal enabledelayedexpansion

REM for /r . %%f in (git-*.cmd) do (
REM     set path=%%~sf 

REM     set alias=%%~nf

REM     git config --global alias.!alias! "!path!"
REM )