@echo off
setlocal

:: Query the registry value
for /f "tokens=3" %%A in ('reg query HKCU\Software\Microsoft\Windows\Shell\Copilot\BingChat /v IsUserEligible') do (
    set IsUserEligible=%%A
)
if "%IsUserEligible%"=="0x0" (
    echo User is not eligible for Copilot. Enabling.
    reg add HKCU\Software\Microsoft\Windows\Shell\Copilot\BingChat /v IsUserEligible /t REG_DWORD /d 1 /f
    echo Copilot enabled. Check your taskbar settings. - Windows 11 only.
    
) else (
    echo User is already eligible for Copilot. Exiting.
)

endlocal
