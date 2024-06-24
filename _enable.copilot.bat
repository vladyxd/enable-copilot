@echo off
setlocal

:: IsUserEligible key check
set "IsUserEligible="
for /f "tokens=3" %%A in ('reg query HKCU\Software\Microsoft\Windows\Shell\Copilot\BingChat /v IsUserEligible 2^>nul') do (
    set IsUserEligible=%%A
)

:: SCB key check
reg query HKCU\Software\Microsoft\CurrentVersion\Explorer\Advanced /v ShowCopilotButton > nul 2>&1
if %errorlevel% neq 0 (
    echo ShowCopilotButton does not exist. Creating and enabling.
    reg add HKCU\Software\Microsoft\CurrentVersion\Explorer\Advanced /v ShowCopilotButton /t REG_DWORD /d 1 /f
) else (
    echo ShowCopilotButton exists. Checking and enabling if necessary.
    for /f "tokens=3" %%B in ('reg query HKCU\Software\Microsoft\CurrentVersion\Explorer\Advanced /v ShowCopilotButton') do (
        if "%%B"=="0x0" (
            echo Copilot button is not visible. Enabling.
            reg add HKCU\Software\Microsoft\CurrentVersion\Explorer\Advanced /v ShowCopilotButton /t REG_DWORD /d 1 /f
        ) else (
            echo Copilot button is already visible.
        )
    )
)

:: debug
echo IsUserEligible detected as: %IsUserEligible%

:: Check and set IsUserEligible
if "%IsUserEligible%"=="0x0" (
    echo User is not eligible for Copilot. Enabling.
    reg add HKCU\Software\Microsoft\Windows\Shell\Copilot\BingChat /v IsUserEligible /t REG_DWORD /d 1 /f
) else if not defined IsUserEligible (
    echo IsUserEligible does not exist. Creating and enabling.
    reg add HKCU\Software\Microsoft\Windows\Shell\Copilot\BingChat /v IsUserEligible /t REG_DWORD /d 1 /f
) else (
    echo User is already eligible for Copilot.
)

echo Copilot settings have been updated. Check your taskbar settings. - Windows 11 only.

endlocal
