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
REM ѡ��˵�
echo #**********************************************************************#
echo       Mysql ���������ű� 
echo #**********************************************************************#
echo       ������ز���˵������ �����л�
echo #**********************************************************************#
echo.
echo [1]����mysql   [2]�ر�mysql 
echo �������˳������� 
echo.
echo #**********************************************************************#
set /P CHS= ��ѡ��: [1],[2] ��س�?

if /I "%CHS%"=="1" (
goto 1111
)
if /I "%CHS%"=="2" (
goto 2222
)
goto eeee
:1111
REM ����mysql 
net start MySQL
pause
cls
goto dosmenu
:2222
REM �ر�mysql
net stop MySQL
pause
cls
goto dosmenu
:eeee
REM �˳�
exit