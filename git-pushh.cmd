@echo off

for /F "tokens=2" %%b in ('git branch') do (
    if not x%%b:"\*"==x%%i set _cBranch=%%b
)

echo Current branch is %_cBranch%

if %1.==. (
    set _remotes=git remote

    for /F "tokens=1" %%r in ('git remote') do (
        echo Shall I push to remote %%r
        choice /C YNC
        
        if ERRORLEVEL==3 (
            exit
        ) else if ERRORLEVEL==2 (
            endlocal 
        ) else if ERRORLEVEL==1 (
            echo Good choice
            git push --set-upstream %%r %_cBranch%
        )
        
    )
) else (
    echo Will push to remote %1
    git push --set-upstream %1 %_cBranch%
)