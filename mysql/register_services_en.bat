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
cd bin

:dosmenu
REM Menu
echo #**********************************************************************#
echo       Mysql Service (U)install Script 
echo #**********************************************************************#
echo       Command Parameters are as follows (quick switch)
echo #**********************************************************************#
echo.
echo [1]Install mysql service   [2]Uinstall mysql service 
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
REM install mysql service 
mysqld install mysql
pause
cls
goto dosmenu
:2222
REM uinstall mysql service
sc delete mysql
pause
cls
goto dosmenu
:eeee
REM quit
exit

