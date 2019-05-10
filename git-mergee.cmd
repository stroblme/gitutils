@echo off
git branch

if %1.==. (
    for /F "tokens=2" %%b in ('git branch') do (
        if not x%%b:"\*"==x%%i set _cBranch=%%b
    )

    echo Current branch is %_cBranch%

    git fetch . %_cBranch%:%2
) else (
    git fetch . %1:%2
)

git checkout %2
git branch