@echo off
title AI Survival USB - The Wired Watchman
color 0A

echo.
echo  ============================================================
echo  ^|                                                          ^|
echo  ^|         AI SURVIVAL USB - Pocket Professor v1.0          ^|
echo  ^|                                                          ^|
echo  ^|    122 Million Books of Knowledge. No Internet Needed.   ^|
echo  ^|                                                          ^|
echo  ^|         The Wired Watchman - thewiredwatchman.com        ^|
echo  ^|                                                          ^|
echo  ============================================================
echo.

REM --- Auto-detect the drive this script is running from ---
set DRIVE=%~d0
echo  [INFO] Drive detected: %DRIVE%

REM --- Set model storage to USB drive ---
set OLLAMA_MODELS=%DRIVE%\ollama\models
echo  [INFO] Model path: %OLLAMA_MODELS%
echo.

REM --- Verify ollama.exe exists ---
if not exist "%DRIVE%\ollama.exe" (
    echo  [ERROR] ollama.exe not found on %DRIVE%
    echo.
    echo  Make sure ollama.exe is in the root of your USB drive.
    echo  See the README for setup instructions.
    echo.
    pause
    exit /b 1
)

REM --- Check for model files ---
if not exist "%DRIVE%\ollama\models" (
    echo  [WARNING] No models folder found at %DRIVE%\ollama\models
    echo  You may need to download the AI model first.
    echo  Run this in PowerShell:
    echo.
    echo    $env:OLLAMA_MODELS = "%DRIVE%\ollama\models"
    echo    %DRIVE%\ollama.exe serve
    echo    (then in a new window)
    echo    %DRIVE%\ollama.exe pull dolphin-llama3
    echo.
    echo  Press any key to try launching anyway...
    pause >nul
)

REM --- Kill any existing Ollama processes ---
call "%~dp0kill_ollama.bat"

REM --- Start the Ollama server in background ---
echo  [1/3] Starting Ollama server...
start "" /min "%DRIVE%\ollama.exe" serve

REM --- Wait for server to be ready ---
echo  [2/3] Waiting for AI to load into memory...
echo.
set /a ATTEMPTS=0

:waitloop
set /a ATTEMPTS+=1
if %ATTEMPTS% GTR 60 (
    echo.
    echo  [ERROR] Server did not start after 2 minutes.
    echo  Try running "ollama.exe serve" manually to see errors.
    echo.
    pause
    exit /b 1
)
timeout /t 2 /nobreak >nul
netstat -an 2>nul | find "LISTENING" | find ":11434" >nul 2>&1
if errorlevel 1 (
    echo  Loading... [%ATTEMPTS%/60]
    goto waitloop
)

echo  [3/3] AI Server is READY!
echo.
echo  ============================================================
echo.
echo   Your AI is loaded and ready. Type any question below.
echo.
echo   TRY THESE:
echo     "How do I purify water in an emergency?"
echo     "Walk me through basic wound care"
echo     "How do I wire a solar panel to a battery?"
echo     "What edible plants grow in the Midwest?"
echo     "Teach me Ohm's law like I'm 12 years old"
echo.
echo   Type /bye to exit the chat.
echo   Then double-click stop.bat to shut down the server.
echo.
echo  ============================================================
echo.

"%DRIVE%\ollama.exe" run dolphin-llama3

echo.
echo  Chat ended. Run stop.bat to fully shut down the server.
echo.
pause
