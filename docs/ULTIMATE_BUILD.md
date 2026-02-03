# 🛡️ The Ultimate Build — 256GB AI + Wikipedia + Manuals

For serious preppers who want the best of everything on one drive.

---

## What You're Building

| Component | Size | What It Does |
|-----------|------|--------------|
| Ollama + Dolphin Llama 3 | ~6 GB | AI that answers any question |
| AnythingLLM Portable | ~500 MB | ChatGPT-style interface + PDF chat |
| Kiwix + Offline Wikipedia | ~22–90 GB | Verified encyclopedia with images |
| Curated Survival PDFs | ~5 GB | Official field manuals and guides |
| Launch Scripts | <1 MB | One-click startup |
| **Total** | **~34–102 GB** | Fits on 256GB with room to spare |

**USB Drive:** SanDisk Ultra Luxe 256GB (USB 3.2) — ~$22

---

## Step 1: Set Up the AI (Same as Main Guide)

Follow the main README setup. Once you have Ollama + Dolphin Llama 3 working on the USB, continue below.

---

## Step 2: Add Offline Wikipedia (Kiwix)

Kiwix lets you browse Wikipedia without internet — complete with images, links, and search.

1. **Download Kiwix Portable for Windows:**
   https://kiwix.org/en/downloads/kiwix-desktop/

2. **Download a Wikipedia ZIM file:**
   https://wiki.kiwix.org/wiki/Content_in_all_languages
   - `wikipedia_en_all_maxi` = Full Wikipedia with images (~90 GB)
   - `wikipedia_en_all_mini` = Text-focused, smaller (~22 GB) ← **recommended**
   - `wikipedia_en_all_nopic` = No pictures (~6 GB) ← smallest option

3. **Copy both to your USB:**
   ```
   G:\kiwix\                    ← Kiwix portable app
   G:\kiwix\data\               ← Put ZIM file(s) here
       └── wikipedia_en_all.zim
   ```

4. **Launch:** Open `kiwix.exe` from the USB, load the ZIM file, browse offline.

---

## Step 3: Add Survival PDFs (Free Sources)

Create a `G:\survival-docs\` folder and fill it with these free resources:

### Military & Government Manuals (Public Domain)
| Document | Source | Size |
|----------|--------|------|
| FM 21-76 US Army Survival Manual | archive.org | ~15 MB |
| FM 5-34 Engineer Field Data | archive.org | ~20 MB |
| FEMA Emergency Preparedness Guide | ready.gov | ~5 MB |
| EPA Emergency Disinfection of Water | epa.gov | ~1 MB |
| USDA Complete Guide to Home Canning | nchfp.uga.edu | ~10 MB |

### Medical References (Free/Open)
| Document | Source | Size |
|----------|--------|------|
| Where There Is No Doctor | hesperian.org | ~20 MB |
| Where There Is No Dentist | hesperian.org | ~10 MB |
| WHO Emergency Response Guide | who.int | ~5 MB |
| First Aid Manual (Red Cross basics) | redcross.org | ~10 MB |

### Agriculture & Homesteading
| Document | Source | Size |
|----------|--------|------|
| USDA Planting Guides by Zone | usda.gov | ~5 MB |
| Composting 101 (EPA) | epa.gov | ~2 MB |
| Seed Saving Guide | various open sources | ~5 MB |

### Technical References
| Document | Source | Size |
|----------|--------|------|
| Basic Electricity (Navy NEETS) | archive.org | ~50 MB |
| Machinery's Handbook (older public domain ed.) | archive.org | ~30 MB |
| Radio Amateurs Handbook | archive.org | ~40 MB |

> **Note:** Always verify the copyright status of documents before redistributing. The sources listed above offer free or public domain versions.

---

## Step 4: Set Up AnythingLLM for PDF Chat (Optional)

AnythingLLM lets you upload those survival PDFs and ask the AI questions *about* them. This is called RAG (Retrieval-Augmented Generation).

1. **Download AnythingLLM Desktop:** https://anythingllm.com
2. **Install to USB:** `G:\anythingllm\`
3. **Configure:**
   - LLM Provider: Ollama (http://localhost:11434)
   - Model: dolphin-llama3
   - Embedding Model: nomic-embed-text (pull with `ollama pull nomic-embed-text`)
4. **Upload your PDFs** into an AnythingLLM workspace
5. **Ask questions:** "According to the Army survival manual, how do I build a debris hut?"

The AI will search your PDFs and answer using both its training AND your uploaded documents.

---

## Step 5: Final Drive Layout

```
G:\ (256GB USB Drive)
│
├── lib\                          ← Ollama libraries
├── ollama\
│   └── models\                   ← AI models (~6 GB)
├── ollama.exe
├── ollama app.exe
│
├── kiwix\                        ← Offline Wikipedia
│   ├── kiwix.exe
│   └── data\
│       └── wikipedia_en_all.zim  ← (~22–90 GB)
│
├── anythingllm\                  ← Chat interface (optional)
│
├── survival-docs\                ← Your curated PDFs (~5 GB)
│   ├── military\
│   ├── medical\
│   ├── agriculture\
│   └── technical\
│
├── start.bat                     ← Launch AI
├── stop.bat                      ← Shut down
└── README.txt                    ← Quick reference
```

---

## The Result

You now have a **$22 USB stick** that contains:
- An AI trained on 122 million books worth of text
- The entire English Wikipedia with images
- Official military, medical, and technical manuals
- A chat interface to ask questions about all of it

Compare that to a $185 Prepper Disk that gives you... static web pages on a Raspberry Pi.
