# 📋 Copy Method — For Users Who Already Have Ollama Installed

If you already have Ollama installed on your PC, you don't need to reinstall it. Just copy the files to your USB drive.

---

## Where Ollama Lives on Your PC

Default install location (Windows):
```
C:\Users\[YourUsername]\AppData\Local\Programs\Ollama\
```

Default model storage:
```
C:\Users\[YourUsername]\.ollama\models\
```

> **Can't find AppData?** It's a hidden folder. In File Explorer, click View → Show → Hidden Items.

---

## Step-by-Step Copy

### 1. Copy Ollama Program Files to USB Root

From `C:\Users\[You]\AppData\Local\Programs\Ollama\` copy these to `G:\` (your USB root):

```
ollama.exe          → G:\ollama.exe
ollama app.exe      → G:\ollama app.exe
app.ico             → G:\app.ico
ollama_welcome.ps1  → G:\ollama_welcome.ps1
```

### 2. Copy the lib Folder

Copy the entire `lib` folder:
```
C:\Users\[You]\AppData\Local\Programs\Ollama\lib\  →  G:\lib\
```

This includes the `ollama` subfolder with CUDA, ROCm, GGML, and CRT DLLs.

### 3. Copy Your Models

From `C:\Users\[You]\.ollama\models\` copy to `G:\ollama\models\`:
```
C:\Users\[You]\.ollama\models\  →  G:\ollama\models\
```

This includes the `manifests` and `blobs` subfolders. The large file in `blobs` (4.5GB for Dolphin Llama 3) is the actual model.

### 4. Verify USB Structure

Your USB should now look like:
```
G:\
├── lib\
│   └── ollama\
│       ├── cuda_v11\
│       ├── cuda_v12\
│       ├── rocm\
│       ├── ggml-*.dll
│       └── api-ms-*.dll
├── ollama\
│   └── models\
│       ├── manifests\
│       └── blobs\
│           └── sha256-ea025c...  (4.5 GB)
├── ollama.exe
├── ollama app.exe
└── (other files)
```

### 5. Test It

```powershell
$env:OLLAMA_MODELS = "G:\ollama\models"
G:\ollama.exe serve
# In another window:
G:\ollama.exe run dolphin-llama3
```

If it responds to questions, you're good. Copy the `start.bat` and `stop.bat` scripts from this repo to your USB root and you're done.
