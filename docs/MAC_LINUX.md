# 🍎🐧 Mac & Linux Setup Guide

This project was built on Windows, but Ollama works great on Mac and Linux too.

---

## macOS

### Install Ollama
```bash
# Download from ollama.com or use Homebrew:
brew install ollama
```

### Set Up on USB Drive
```bash
# Find your USB drive (usually /Volumes/USB321FD or similar)
export OLLAMA_MODELS="/Volumes/YOUR_USB/ollama/models"

# Start server
ollama serve &

# Pull the model
ollama pull dolphin-llama3

# Run it
ollama run dolphin-llama3
```

### Create Launch Script (start.sh)
Save this as `start.sh` on your USB root:
```bash
#!/bin/bash
DRIVE=$(dirname "$(realpath "$0")")
export OLLAMA_MODELS="$DRIVE/ollama/models"

echo "AI Survival USB - Starting..."
echo "Drive: $DRIVE"
echo "Models: $OLLAMA_MODELS"

ollama serve &
sleep 5
ollama run dolphin-llama3
```

Make it executable: `chmod +x start.sh`

> **Note:** On Mac, you'll need Ollama installed on the system (via brew or the .dmg). The USB carries the model, but the Ollama binary runs from the Mac.

---

## Linux (Ubuntu/Debian)

### Install Ollama
```bash
curl -fsSL https://ollama.com/install.sh -o install.sh
# Inspect the script before running
cat install.sh
sh install.sh
```

### Set Up on USB Drive
```bash
# Find your USB (check with lsblk or mount)
# Usually /media/username/USB321FD or /mnt/usb
export OLLAMA_MODELS="/media/$USER/YOUR_USB/ollama/models"

# Start and pull
ollama serve &
sleep 5
ollama pull dolphin-llama3

# Run
ollama run dolphin-llama3
```

### Create Launch Script (start.sh)
Same as the Mac version above. Save to USB root, `chmod +x start.sh`.

---

## Portable Linux Setup (Advanced)

For a truly portable Linux setup, you can include the Ollama binary on the USB:

```bash
# Download the Linux binary
curl -L https://ollama.com/download/ollama-linux-amd64 -o /media/$USER/YOUR_USB/ollama-linux

chmod +x /media/$USER/YOUR_USB/ollama-linux
```

Then your start script can reference the binary directly from the USB without needing Ollama pre-installed on the system.

---

## Differences from Windows

- No `.bat` files — use `.sh` scripts instead
- File paths use `/` not `\`
- USB drives mount at `/Volumes/` (Mac) or `/media/` (Linux) instead of drive letters
- Everything else is identical — same models, same commands, same results
