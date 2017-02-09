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
REM 选择菜单
echo #**********************************************************************#
echo       Mysql 服务注册脚本 
echo #**********************************************************************#
echo       命令相关参数说明如下 快速切换
echo #**********************************************************************#
echo.
echo [1]注册mysql服务   [2]卸载mysql服务 
echo 其它键退出本程序 
echo.
echo #**********************************************************************#
set /P CHS= 请选择: [1],[2] 后回车?

if /I "%CHS%"=="1" (
goto 1111
)
if /I "%CHS%"=="2" (
goto 2222
)
goto eeee
:1111
REM 注册mysql服务 
mysqld install mysql
pause
cls
goto dosmenu
:2222
REM 卸载mysql服务
sc delete mysql
pause
cls
goto dosmenu
:eeee
REM 退出
exit

