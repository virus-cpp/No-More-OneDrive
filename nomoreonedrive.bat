@echo off
echo No More OneDrive Script
echo Author: mr.akz
timeout 5
cd C:\Users\%USERNAME%\
mkdir Desktop
@echo off
set "source=C:\Users\%username%\OneDrive\Desktop"
set "destination=C:\Users\%username%\Desktop"

REM Check if destination folder exists
if not exist "%destination%\" (
    echo Destination folder not found: %destination%
    exit /b
)

REM Move files and directories
xcopy /E /I /Y "%source%" "%destination%"
del /S /Q "%source%"
rmdir /S /Q "%source%"


taskkill /F /IM OneDrive.exe
rename C:\Users\noobe\AppData\Local\Microsoft\OneDrive\OneDrive.exe C:\Users\noobe\AppData\Local\Microsoft\OneDrive\OneDrive.x
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop /t REG_SZ /d C:\Users\%USERNAME%\Desktop /f
set /p UserInput=Do you want to restart your computer (Y/N)?
if "%UserInput%" == "y" (
    shutdown /r /t 0
)
if "%UserInput%" == "Y" (
    shutdown /r /t 0
)

if "%UserInput%" == "N" (
    echo Make sure you restart to save configurations!
)

if "%UserInput%" == "n" (
    echo Make sure you restart to save configurations!
)