# 🧠 AI Survival USB — 122 Million Books on a $15 USB Stick

### Stop paying $185 for "offline internet." Build something 1,000x more powerful for the cost of a flash drive.

<p align="center">
  <img src="https://img.shields.io/badge/Cost-Under_$15-brightgreen?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Internet-NOT_Required-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Knowledge-122_Million_Books-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" />
</p>

---

## 🔥 What Is This?

A complete guide and toolkit to put a **fully functional AI assistant on a USB stick** that runs **100% offline** — no internet, no subscription, no cloud. Plug it into any Windows PC with 8GB+ RAM and start asking it anything.

Companies sell "offline survival drives" for $140–$185 stuffed with static PDFs and Wikipedia dumps. **This project gives you an actual AI brain** trained on the equivalent of **122 million books** — roughly **3x the entire Library of Congress** — for under $15.

> **Created by [The Wired Watchman](https://thewiredwatchman.com)** — Tips and Reviews by Technicians, for Technicians.

---

## 📊 Why This Exists — The Price Comparison

| Product | Price | What You Actually Get |
|---------|-------|-----------------------|
| Prepper Disk Premium | **$185** | Raspberry Pi 4B + 512GB SD card with static files |
| Prepper Disk Classic | **$140** | Raspberry Pi + 256GB of PDFs & offline Wikipedia |
| SurvivalNet | **$100–$200** | Raspberry Pi + WiFi hotspot serving static pages |
| Omega Drive 128GB | **$40–$80** | USB stick with 400 PDFs + basic keyword search |
| Doomsday USB | **$30–$50** | USB stick with offline Wikipedia only |
| eBay "AI USB" sticks | **$50–$100+** | Pre-installed Ollama (what we build here for free) |
| **🏆 AI Survival USB (This Project)** | **~$15** | **Full AI model — 11 TRILLION words of training** |

You could make **10 of these** for the cost of one Prepper Disk Premium.

---

## 🧮 The Numbers That Break Your Brain

The Dolphin Llama 3 model (8 billion parameters) on this USB was trained on:

| Metric | Value |
|--------|-------|
| Training tokens | **15 trillion** |
| Equivalent words | **~11 trillion** |
| Equivalent books (avg 90k words) | **~122 million** |
| Compared to Library of Congress | **~3x** (LoC = 39M print books) |
| Human lifetimes of reading | **18,000–110,000x** |

Now compare that to the commercial products:

| Product Content | Words | % of This AI's Training |
|-----------------|-------|-------------------------|
| Omega Drive (400 PDFs) | ~36 million | **0.0003%** |
| Offline Wikipedia | ~4.7 billion | **0.04%** |
| Prepper Disk (everything) | ~10–20 billion | **0.1–0.2%** |

Those products give you files to *search through*. **This AI *thinks* for you.**

See [docs/KNOWLEDGE_MATH.md](docs/KNOWLEDGE_MATH.md) for the full breakdown.

---

## 🎯 What Can It Do?

| Category | Example Question |
|----------|------------------|
| 🏥 Medical | "How do I treat a deep laceration with no medical supplies?" |
| 🌲 Survival | "How do I purify water with sunlight and plastic bottles?" |
| 🔧 Repair | "Walk me through diagnosing a no-start on a diesel engine" |
| 🌾 Agriculture | "What crops grow in clay soil in zone 6?" |
| ⚡ Electrical | "How do I wire a solar panel to a 12V battery?" |
| 🧪 Chemistry | "How do I make soap from animal fat and wood ash?" |
| 📻 Comms | "How do I set up a HAM radio repeater?" |
| 🍳 Food | "How do I preserve meat without refrigeration?" |
| 📚 Teaching | "Teach me algebra like I'm 14 years old" |
| 💊 Medicine | "What natural plants have antibiotic properties?" |

Unlike static PDFs, the AI **adapts to your exact question** — step by step, in plain English, at whatever level you need.

---

## 🛒 What You Need to Buy

| Item | Price | Recommendation |
|------|-------|----------------|
| **128GB USB 3.0+ flash drive** | $12–$18 | Samsung Fit Plus or SanDisk Ultra |

That's the entire shopping list. **Software is 100% free.**

### Your Computer Needs:
- **Windows 10 or 11** (Mac/Linux — see [docs/MAC_LINUX.md](docs/MAC_LINUX.md))
- **8GB RAM minimum** (16GB recommended)
- Any CPU from the last ~8 years (Intel i5+ or AMD Ryzen)
- No GPU required (NVIDIA GPU makes it faster, but optional)

---

## 🚀 COMPLETE SETUP GUIDE

> ⏱️ **Time:** ~20 minutes + download time for the 4.7GB model
>
> 🌐 **Internet:** Required only during setup. Never again after that.

---

### STEP 1 — Download Ollama

Go to **https://ollama.com/download** → Click **Download for Windows**

> **What is Ollama?** Free, open-source software that runs AI models locally on your machine. It's the engine — the model is the brain.

---

### STEP 2 — Install Ollama TO Your USB Drive

1. Plug your USB drive in (we'll say it's drive **G:** — yours may differ)
2. Run the Ollama installer you downloaded
3. **IMPORTANT:** When it asks for install location, **browse to your USB drive root** (`G:\`)
4. Let the install finish

After install, your USB should have these files:

```
G:\
├── lib/                    ← Runtime libraries (DLLs, CUDA)
│   └── ollama/
│       ├── cuda_v11/       ← NVIDIA GPU acceleration
│       ├── cuda_v12/       ← NVIDIA GPU acceleration  
│       ├── rocm/           ← AMD GPU support
│       ├── ggml-base.dll
│       ├── ggml-cpu-alderlake.dll
│       ├── ggml-cpu-haswell.dll
│       ├── ggml-cpu-icelake.dll
│       ├── ggml-cpu-sandybridge.dll
│       ├── ggml-cpu-skylakex.dll
│       └── api-ms-win-crt-*.dll
├── ollama/                 ← Model storage (empty for now)
├── ollama app.exe          ← GUI launcher (6.8 MB)
├── ollama.exe              ← Main program (30.5 MB)
├── ollama_welcome.ps1
├── unins000.exe
├── unins000.dat
├── unins000.msg
└── app.ico
```

> **Already have Ollama installed on your PC?** See [docs/COPY_METHOD.md](docs/COPY_METHOD.md) for how to copy files manually instead.

---

### STEP 3 — Download the AI Model (One-Time, Needs Internet)

This is the only step that requires an internet connection.

**Open PowerShell** (press `Win + X` → select "Terminal" or search "PowerShell"):

```powershell
# 1. Set the model storage path to your USB drive
$env:OLLAMA_MODELS = "G:\ollama\models"

# 2. Start the Ollama server
Start-Process -FilePath "G:\ollama.exe" -ArgumentList "serve" -WindowStyle Minimized

# 3. Wait for server startup
Start-Sleep -Seconds 5

# 4. Download the AI model (~4.7 GB download)
G:\ollama.exe pull dolphin-llama3
```

Wait for the download to complete. When done, your `ollama\models\blobs\` folder will have a large file:

```
sha256-ea025c107c1c3e5a87380b25e205d...    4,551,976 KB (~4.5 GB)
```

**That single file IS the AI.** 122 million books of compressed knowledge.

> **Why Dolphin Llama 3?** It's an *uncensored* version of Meta's Llama 3. Standard ChatGPT blocks survival, weapons, medical, and self-defense topics. Dolphin answers everything. In a real emergency, you need real answers — not corporate liability filters.

---

### STEP 4 — Add the Launch Scripts

Copy the three scripts from this repo's `scripts/` folder onto the **root** of your USB:

| File | Purpose |
|------|---------|
| **[start.bat](scripts/start.bat)** | 🟢 Double-click to launch the AI |
| **[stop.bat](scripts/stop.bat)** | 🔴 Double-click to shut it down |
| **[kill_ollama.bat](scripts/kill_ollama.bat)** | 🛠️ Helper script to terminate processes |

Or download this whole repo as a ZIP (green "Code" button → "Download ZIP") and copy the scripts out.

---

### STEP 5 — Test It OFFLINE

This is the moment of truth:

1. **Turn OFF your WiFi. Unplug ethernet.** No internet.
2. Double-click **`start.bat`** on your USB drive
3. Wait ~30 seconds for the AI to load into memory
4. You'll see a prompt — type a question:

```
>>> How do I purify water in an emergency?
```

5. Watch it think and respond — **completely offline, zero internet**.

**Congratulations. You just built a $15 survival AI that outperforms a $185 product.**

---

### STEP 6 — Carry It Everywhere

- Eject the USB drive safely (run `stop.bat` first)
- Plug it into ANY Windows PC with 8GB+ RAM
- Double-click `start.bat`
- You're up and running

No install required on the new machine. It's fully portable.

---

## 📁 Final USB Drive Layout

```
G:\ (Your USB Drive)
│
├── lib/                              ← Ollama runtime libraries
│   └── ollama/
│       ├── cuda_v11/                 ← NVIDIA GPU support
│       ├── cuda_v12/                 ← NVIDIA GPU support
│       ├── rocm/                     ← AMD GPU support
│       ├── ggml-base.dll             ← Core AI computation
│       ├── ggml-cpu-*.dll            ← CPU-optimized libraries
│       └── api-ms-win-crt-*.dll      ← Windows runtime
│
├── ollama/
│   └── models/
│       ├── manifests/                ← Model registry
│       └── blobs/
│           └── sha256-ea025c...      ← THE AI BRAIN (4.5 GB)
│
├── ollama.exe                        ← Main program (30.5 MB)
├── ollama app.exe                    ← GUI launcher (6.8 MB)
├── app.ico
├── ollama_welcome.ps1
│
├── start.bat                         ← 🟢 LAUNCH THE AI
├── stop.bat                          ← 🔴 SHUT IT DOWN
├── kill_ollama.bat                   ← 🛠️ PROCESS KILLER
└── README.txt                        ← Quick reference card
```

**Total: ~5–6 GB used.** On a 128GB drive, you still have 120GB+ free.

---

## ⚡ Pro Tips

### 🏎️ Speed Boost — Copy to Hard Drive
Running from USB works but is slower. For daily use, copy everything to your PC:
```powershell
mkdir C:\AI-Survival
xcopy G:\* C:\AI-Survival\ /E /H /Y
```
Keep the USB as your **portable backup**. Use the hard drive as your **daily driver**.

### 🎮 GPU Acceleration
NVIDIA GPU (GTX 1050+)? Ollama uses it automatically via the CUDA folders already on the USB. Expect **5–10x faster** responses.

### 📦 Alternative Models
| Model | Size | Command | Best For |
|-------|------|---------|----------|
| `dolphin-llama3` | 4.7GB | `ollama pull dolphin-llama3` | General + uncensored ⭐ |
| `llama3.1:8b` | 4.7GB | `ollama pull llama3.1:8b` | General, safety-filtered |
| `mistral:7b` | 4.1GB | `ollama pull mistral:7b` | Fast reasoning |
| `phi3:mini` | 2.3GB | `ollama pull phi3:mini` | Weak PCs (4GB RAM) |
| `meditron:7b` | 4.1GB | `ollama pull meditron:7b` | Medical-focused |

Always set `$env:OLLAMA_MODELS = "G:\ollama\models"` before pulling.

### 🖥️ ChatGPT-Style Interface (Optional)
| Tool | Link | Notes |
|------|------|-------|
| Open WebUI | [open-webui](https://github.com/open-webui/open-webui) | Most ChatGPT-like |
| AnythingLLM | [anythingllm.com](https://anythingllm.com) | Chat with your own PDFs |
| LM Studio | [lmstudio.ai](https://lmstudio.ai) | All-in-one manager |

---

## 🛡️ The Ultimate Build — 256GB USB ($22)

| Component | Size | Purpose |
|-----------|------|---------|
| Ollama + Dolphin Llama 3 | ~6GB | AI brain |
| AnythingLLM Portable | ~500MB | Chat interface + PDF uploads |
| Kiwix + Offline Wikipedia | ~90GB | Verified facts, images, maps |
| Survival PDFs | ~5GB | Field manuals, medical guides |
| **Total** | **~102GB** | Room to spare |

See [docs/ULTIMATE_BUILD.md](docs/ULTIMATE_BUILD.md) for the full guide.

---

## ⚠️ Honest Disclaimers

**What this CANNOT do:**
- ❌ No images, maps, or diagrams (text only — add Kiwix for that)
- ❌ Not 100% accurate (AI can hallucinate — verify critical info)
- ❌ Needs a computer with 8GB+ RAM
- ❌ Slower on USB than internal drive
- ❌ Knowledge cutoff (trained through early 2024)
- ❌ Not a substitute for real hands-on training

**What this CAN do:**
- ✅ Answer questions on virtually any topic
- ✅ Reason through problems step by step
- ✅ Adapt to your situation and skill level
- ✅ Work 100% offline — forever
- ✅ Run on any modern Windows PC
- ✅ Cost under $15
- ✅ Keep your data completely private

---

## 📺 The Wired Watchman

| Platform | Link |
|----------|------|
| 🎥 YouTube | [youtube.com/@TheWiredWatchman](https://youtube.com/@TheWiredWatchman) |
| 📱 TikTok | [@wiredwatchman](https://tiktok.com/@wiredwatchman) |
| 💼 LinkedIn | [linkedin.com/in/josephoverberg](https://linkedin.com/in/josephoverberg) |
| 🐦 X/Twitter | [@wiredwatchman](https://x.com/wiredwatchman) |
| 🌐 Website | [thewiredwatchman.com](https://thewiredwatchman.com) |
| 🐙 GitHub | [github.com/TheWiredWatchman](https://github.com/TheWiredWatchman) |

> *I'm Joseph, The Wired Watchman. Subscribe for Tips and Reviews by Technicians, for Technicians.*

---

## 🤝 Contributing

- **Better model recommendation?** Open a PR
- **Mac/Linux setup guide?** Open a PR
- **Free survival PDF links?** Open a PR
- **Made a video?** Post a link in Issues!

## 📜 License

MIT — Use it, share it, build on it, teach it.

---

### ⭐ If this saved you $185, hit that star button.
