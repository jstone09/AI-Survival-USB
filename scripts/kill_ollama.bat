@echo off
REM --- Kill any existing Ollama processes ---
taskkill /f /im ollama.exe >nul 2>&1
taskkill /f /im "ollama app.exe" >nul 2>&1
timeout /t 2 /nobreak >nul
