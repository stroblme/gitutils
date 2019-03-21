@echo off
for %%i in (.\*) do (
    set file=%%i
    if not x%file:cmd=%==x%file% 
    if not x%file:git=%==x%file%
    
)