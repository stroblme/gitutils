@echo off
setlocal EnableDelayedExpansion

git branch

for /F "tokens=2" %%b in ('git branch') do (
    if not x%%b:"\*"==x%%i set _cBranch=%%b
)

echo Current branch is %_cBranch%

if %1.==. (
    set /a _count=0

    for /F "tokens=1" %%r in ('git remote') do (
        set /a _count+=1
        set _cRemote=%%r
    )

    if !_count! gtr 1 (
        for /F "tokens=1" %%r in ('git remote') do (
            echo Shall I push to remote %%r
            choice /C YNC /D Y /T 5

            if ERRORLEVEL==3 (
                echo Cancelling...
                exit
            ) else if ERRORLEVEL==2 (
                echo Skipping...
                endlocal
            ) else if ERRORLEVEL==1 (
                echo Processing...
                git push --set-upstream %%r !_cBranch!
            )

        )
    ) else (
        git push --set-upstream !_cRemote! !_cBranch!
    )
) else (
    echo Will push to remote %1
    git push --set-upstream %1 %_cBranch%
)