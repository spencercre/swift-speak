# Swift Speak

Hold a key. Speak. Done.

Hands-free voice dictation for Windows. Hold `Ctrl+Win`, speak, release — text appears in your active app. Local transcription only. No cloud. No accounts.

Part of the [GetNoodling](https://getnoodling.com) suite.

---

## How it works

1. Hold `Ctrl+Win` — tray icon turns red, mic starts recording
2. Speak
3. Release — tray turns green while transcribing, then text is injected via clipboard

---

## Requirements

**Runtime (Windows)**
- Python 3.10+
- `pip install faster-whisper sounddevice`

**Development (Linux/Mac)**
- Node.js 18+
- Python 3.10+
- `pip install faster-whisper sounddevice`
- `xdotool` for keyboard simulation on Linux

---

## Dev setup

```bash
npm install
npm run build   # compile TypeScript → dist/
npm run dev     # launch Electron
```

---

## Build Windows installer

On a Windows machine (or with Wine/cross-compilation):

```bash
npm run dist:win
# Output: release/Swift Speak Setup.exe
```

---

## Settings

Right-click the tray icon → Settings:

| Setting | Default | Notes |
|---------|---------|-------|
| Microphone | System Default | Select any input device |
| Hotkey | `Control+Super` | Electron accelerator format |
| Model | Base | Tiny (fast) / Base / Small (accurate) |

Settings are stored in Electron's `userData` dir (`settings.json`).

---

## Whisper model cache

Models download on first use to `.whisper-cache/`. Base.en is ~150 MB.
To pre-download: `python3 src/whisper_worker.py /dev/null base`

---

## Icons

Replace `assets/icon-idle.png`, `icon-recording.png`, `icon-transcribing.png`
with production-quality 256×256 icons before shipping.
For Windows `.ico`, use a multi-resolution file at `assets/icon.ico`.
