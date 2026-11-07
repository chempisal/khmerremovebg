@echo off
title Create Desktop Shortcut
echo Creating desktop shortcut for AI RemoveBG Offline...

set SCRIPT_DIR=%~dp0
set TARGET_BAT=%SCRIPT_DIR%run.bat
set SHORTCUT_PATH=%USERPROFILE%\Desktop\AI RemoveBG Offline.lnk

powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SHORTCUT_PATH%'); $s.TargetPath = '%TARGET_BAT%'; $s.WorkingDirectory = '%SCRIPT_DIR%'; $s.Description = 'AI RemoveBG Offline - 100%% Local AI Background Remover'; $s.Save()"

echo.
echo ========================================================
echo   Shortcut successfully created on your Desktop!
echo   បានបង្កើត Shortcut លើ Desktop រួចរាល់!
echo ========================================================
echo.
pause

