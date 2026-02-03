@echo off
title AI Survival USB - Shutting Down
color 0C

echo.
echo  ============================================
echo    AI Survival USB - Shutting Down...
echo  ============================================
echo.

echo  Stopping Ollama server...
taskkill /f /im ollama.exe >nul 2>&1
taskkill /f /im "ollama app.exe" >nul 2>&1

timeout /t 2 /nobreak >nul

REM --- Verify it's stopped ---
tasklist /fi "imagename eq ollama.exe" 2>nul | find "ollama.exe" >nul 2>&1
if %errorlevel%==0 (
    echo  [WARNING] Ollama still running. Force killing...
    taskkill /f /t /im ollama.exe >nul 2>&1
    timeout /t 2 /nobreak >nul
)

echo.
echo  ============================================
echo    Server stopped. Safe to eject your USB.
echo  ============================================
echo.
echo  To eject safely:
echo    Right-click your USB drive in File Explorer
echo    Click "Eject" or "Safely Remove"
echo.

pause
