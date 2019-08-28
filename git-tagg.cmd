@echo off
git tag -d %1
git tag %1

for /F "tokens=1" %%r in ('git remote') do (
	set /a _count+=1
	set _cRemote=%%r
)

for /F "tokens=1" %%r in ('git remote') do (
	echo Shall I push to remote %%r
	choice /C YNC
	
	if ERRORLEVEL==3 (
		echo Cancelling...
		exit
	) else if ERRORLEVEL==2 (
		echo Skipping...
		endlocal 
	) else if ERRORLEVEL==1 (
		echo Processing...
		git push --follow-tags %%r
	)
	
)