=====================================================
  AI SURVIVAL USB - Quick Reference Card
  The Wired Watchman | thewiredwatchman.com
=====================================================

HOW TO START:
  1. Plug this USB into any Windows PC (8GB+ RAM)
  2. Double-click: start.bat
     (Requires kill_ollama.bat to be in the same folder)
  3. Wait ~30 seconds for AI to load
  4. Type your question and press Enter
  5. Type /bye to exit

HOW TO STOP:
  Double-click: stop.bat
  (Requires kill_ollama.bat to be in the same folder)
  Then safely eject the USB drive

EXAMPLE QUESTIONS:
  - How do I purify water in an emergency?
  - Walk me through treating a burn
  - How do I start a fire without matches?
  - What wild plants are edible in the Midwest?
  - How do I wire a 12V solar setup?
  - Teach me basic first aid

TROUBLESHOOTING:
  - "ollama.exe not found" = Make sure ollama.exe
    is in the root of this USB drive
  - Slow responses = Copy files to C:\AI-Survival
    for faster speed (USB is slower than hard drive)
  - "Not enough memory" = Need 8GB RAM minimum
  - Antivirus warning = Ollama opens port 11434
    locally. It's safe. Whitelist it.

MANUAL START (if start.bat doesn't work):
  1. Open PowerShell
  2. Run: $env:OLLAMA_MODELS = "G:\ollama\models"
     (change G: to your actual drive letter)
  3. Run: G:\ollama.exe serve
  4. Open second PowerShell window
  5. Run: $env:OLLAMA_MODELS = "G:\ollama\models"
  6. Run: G:\ollama.exe run dolphin-llama3

FULL DOCUMENTATION:
  github.com/TheWiredWatchman/AI-Survival-USB

SUBSCRIBE:
  YouTube:  youtube.com/@TheWiredWatchman
  TikTok:   tiktok.com/@wiredwatchman
  Website:  thewiredwatchman.com
  GitHub:   github.com/TheWiredWatchman
