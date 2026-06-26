@echo off
REM --- Kill any existing Ollama processes ---
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
