@echo off
:: BatchGotAdmin
:-------------------------------------
REM --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo Requesting administrative privileges...
goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
exit /B

:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
:--------------------------------------


:dosmenu
REM Menu
echo #**********************************************************************#
echo       Mysql Service Startup Script 
echo #**********************************************************************#
echo       Command Parameters are as follows (quick switch)
echo #**********************************************************************#
echo.
echo [1]start mysql   [2]stop mysql 
echo Any other keys to exit! 
echo.
echo #**********************************************************************#
set /P CHS= Please Select: [1],[2] and then press enter?

if /I "%CHS%"=="1" (
goto 1111
)
if /I "%CHS%"=="2" (
goto 2222
)
goto eeee
:1111
REM start mysql 
net start MySQL
pause
cls
goto dosmenu
:2222
REM stop mysql
net stop MySQL
pause
cls
goto dosmenu
:eeee
REM quit
exit