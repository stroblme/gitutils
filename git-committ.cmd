@echo off
setlocal enabledelayedexpansion

git add ./

for %%m in (%*) do (
   set message=!message! %%m
)

git commit -m "%message%"
git pushh
git logg