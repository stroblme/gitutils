@echo off

if "%~1"=="" goto remoteProcessing else goto parameterProcessing

:remoteProcessing
FOR /F %%I IN ('git remote') DO SET var=%%I

for %%i in (%var%) do  (
    echo %%i
)

:parameterProcessing
echo %1
REM git push --set-upstream %1 master