# ❓ Frequently Asked Questions

---

### Q: Does this REALLY work offline?
**Yes.** Once the model is downloaded to your USB drive, it never needs internet again. The AI runs entirely on your computer's CPU (and GPU if you have one). No cloud, no API calls, no phoning home.

---

### Q: What computer do I need?
- **Minimum:** 8GB RAM, any modern CPU (Intel i5 or AMD Ryzen from 2016+), Windows 10/11
- **Recommended:** 16GB RAM, NVIDIA GPU (GTX 1050 or newer)
- **Won't work:** Phones, tablets, Chromebooks, or PCs with less than 8GB RAM

---

### Q: How fast are the responses?
- **With NVIDIA GPU:** Near-instant. Full answers in 5–15 seconds.
- **CPU only (8GB RAM):** Slower. Expect 15–60 seconds for detailed answers.
- **From USB drive:** Add a few extra seconds for initial load vs. running from hard drive.

---

### Q: Can this run on a phone or tablet?
Not from a USB stick. But there are apps like **Private LLM** (iOS) and **MLC Chat** (Android) that run small models directly on modern phones. They're separate from this project.

---

### Q: Is the AI always accurate?
**No.** AI models can "hallucinate" — generate confident-sounding but incorrect information. This is especially important for:
- Medical dosages and treatments
- Plant identification (poisonous vs. edible)
- Legal information
- Technical specifications

**Always cross-reference critical information** with verified sources. The AI is a starting point, not the final word.

---

### Q: Why Dolphin Llama 3 and not regular Llama 3?
Dolphin is an "uncensored" fine-tune. Regular Llama 3 (and ChatGPT, Copilot, etc.) will refuse to answer many survival-relevant questions — weapons maintenance, certain medical procedures, chemical processes, etc. In a real emergency, you need answers, not a lecture about liability.

---

### Q: Can I put multiple models on the same USB?
Yes! A 128GB drive has room for several models. Just pull additional ones:
```powershell
$env:OLLAMA_MODELS = "G:\ollama\models"
G:\ollama.exe pull mistral:7b
G:\ollama.exe pull phi3:mini
```
Switch between them by running: `G:\ollama.exe run mistral:7b`

---

### Q: Can I add my own documents (PDFs, manuals)?
Yes, but you need an extra tool. **AnythingLLM** lets you upload PDFs and chat with them using your local Ollama model. This is called RAG (Retrieval-Augmented Generation). See [ULTIMATE_BUILD.md](ULTIMATE_BUILD.md) for setup.

---

### Q: What's the difference between this and ChatGPT?
| | ChatGPT | AI Survival USB |
|--|---------|----------------|
| Needs internet | Yes, always | No, never |
| Monthly cost | $0–$20/month | One-time $15 |
| Censored | Yes | No (Dolphin) |
| Your data stays private | No (sent to OpenAI) | Yes (100% local) |
| Quality | Higher (larger model) | Good (smaller model) |
| Works in disaster/grid-down | No | Yes |

---

### Q: How does this compare to those eBay "AI USB sticks?"
Those sticks are literally the same thing we're building here — Ollama + a model on a USB drive — sold for $50–$100+. They're reselling free software on a $15 flash drive. This repo teaches you to build it yourself.

---

### Q: Can I sell USB sticks I make with this?
The MIT license allows commercial use. Ollama is also MIT-licensed. The Dolphin Llama 3 model follows Meta's Llama license (free for most uses). So yes, you can build and sell them — just be honest about what they are and what they can/can't do.

---

### Q: My antivirus flagged ollama.exe — is it safe?
Some antivirus programs flag Ollama because it opens a local network port (11434) to serve the AI. This is normal and expected — it's how the chat interface communicates with the model. Ollama is open source, widely used, and safe. You can review the source code at https://github.com/ollama/ollama.

---

### Q: How do I update the model later?
Connect to internet and run:
```powershell
$env:OLLAMA_MODELS = "G:\ollama\models"
G:\ollama.exe pull dolphin-llama3
```
It will download only the changes (delta update), not the whole 4.7GB again.

---

### Q: What if I break something?
Delete the `ollama/models` folder on your USB and re-pull the model. Everything else can be reinstalled from ollama.com. The scripts in this repo are just text files — re-download them anytime.
