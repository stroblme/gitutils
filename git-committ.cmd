@echo off
setlocal enabledelayedexpansion

git add ./

for %%m in (%*) do (
   set message=!message! %%m
)

call :TrimSpaces actual !message!

git commit -m "!actual!"
git pushh
git logg

exit

:TrimSpaces
    setlocal enabledelayedexpansion
    set Params=%*
    for /f "tokens=1*" %%a in ("!Params!") do EndLocal & set %1=%%b
    exit /b