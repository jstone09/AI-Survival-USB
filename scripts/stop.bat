@echo off
title AI Survival USB - Shutting Down
color 0C

echo.
echo  ============================================
echo    AI Survival USB - Shutting Down...
echo  ============================================
echo.

echo  Stopping Ollama server...
call "%~dp0kill_ollama.bat"

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
