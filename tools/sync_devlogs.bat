@echo off
setlocal

cd /d C:\Users\ville\Documents\GitHub\AuthManager-Portfolio

if not exist devlog mkdir devlog

copy /Y "C:\Users\ville\Documents\GitHub\AuthManagerAPI\docs\devlog.md" "devlog\AuthManagerAPI-devlog.md"
copy /Y "C:\Users\ville\Documents\GitHub\AuthManager\docs\devlog.md" "devlog\AuthManager-devlog.md"

echo Devlogs synced.
pause
endlocal