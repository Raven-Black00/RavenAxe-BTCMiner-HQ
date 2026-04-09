# ᚱᚨᚹᛖᚾᚠᛟᚱᚷᛖ — RavenForge Instructions
### ᚷᛟᛚᛞ ᚺᚨᛗᛗᛖᚱ · The Keeper's Codex

> *The forge does not merely build.*
> *It breathes, pulses, and watches — an instrument of the Allfather.*

**Version: 5.4.0** — ᚢ URUZ · The Forge Reborn  
*April 9, 2026*

ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ ᚺ ᚾ ᛁ ᛃ ᛇ ᛈ ᛉ ᛊ ᛏ ᛒ ᛖ ᛗ ᛚ ᛜ ᛞ ᛟ

---

## ᛟ What Is RavenForge?

**RavenForge** is a graphical build assistant for **RavenMiner HQ** — it
automates the full PyInstaller packaging workflow: dependency installation,
spec file generation, `.exe` compilation, and output delivery.

Forged in Python + tkinter and sealed with PyInstaller into a single `.exe`.

---

## ᚠ Requirements

| Rune | Dependency | Purpose |
|---|---|---|
| ᚠ FEHU | Python 3.10+ | The serpent of Midgard |
| ᚨ ANSUZ | `pip` | Summons dependencies |
| ᛏ TIWAZ | PyInstaller | Forges the `.exe` |
| ᚲ KENAZ | Pillow (optional) | Icon preview in the chooser |

---

## ᚨ Installation

```bash
git clone https://github.com/Raven-Black00/RavenAxe-BTCMiner-HQ.git
cd RavenAxe-BTCMiner-HQ
python ravenforge_v2.py
```

No separate install step required — RavenForge handles its own dependencies
before each build.

---

## ᚹ Viking Font Setup (Optional but Recommended)

RavenForge uses **Viking Regular** for the pulsing gold title.

1. Obtain `Viking.ttf` (Viking Regular — free download)
2. Place it in **any** of these locations:
   - Same folder as `ravenforge_v2.py` ← easiest
   - `C:\Windows\Fonts\`
   - `%LOCALAPPDATA%\Microsoft\Windows\Fonts\`
   - `./fonts/` subfolder

RavenForge detects and registers it automatically via Windows GDI at startup.
If absent, it falls back: Palatino Linotype → Book Antiqua → Georgia.

---

## ⚒ Build Workflow

### Step 1 — Select Your Script
Click **📂 Browse** and navigate to your `Ravenminer_HQ_*.py` source file.

### Step 2 — Choose an Icon (Optional)
Click the icon chooser canvas. A file dialog opens — select `.ico`, `.png`,
`.jpg`, or `.bmp`. A live 64×64 preview renders immediately via PIL.
Click `✕ clear` to remove the selection.

### Step 3 — Configure Options
- **One File** — bundles everything into a single `.exe` (recommended)
- **Windowed** — suppresses the console window on launch
- **Install Reqs** — runs `pip install -r requirements.txt` before building

### Step 4 — Forge
Click **⚒ FORGE**. The button breathes gold while idle and dims when building.
Progress is shown step-by-step — cyan pulse on active steps, green/red
lock-in on completion.

The finished `.exe` lands in `dist\`.

---

## ᚾ The Animated Interface

| Element | Animation | Meaning |
|---|---|---|
| **RAVENFORGE title** | Gold pulse (Viking font, 36pt) | The forge is awake |
| **Vegvisir compass** | Rotating rune ring + spoke pulse | Wayfinding — build finds its path |
| **Rune particle field** | Drifting Elder Futhark | The old gods watch |
| **GlowLine borders** | Sweeping gold/purple gradient | Power flows through the longhouse |
| **⚒ FORGE button** | Gold breathe (idle only) | Ready to strike |
| **Active step rows** | Cyan pulse | Step is running |
| **Console rune ticker** | Cycling dim colours | Heartbeat of the forge |
| **Side rune banners** | Independent rotation cycles | Left and right sentinels |

---

## ᛜ Troubleshooting

**New RavenForge windows keep appearing during build**
→ Fixed in v5.4.0 (BUG-F01). Update to current version.
  Root cause: frozen `.exe` used `sys.executable` (itself) for subprocess calls.

**Viking font not showing**
→ Place `Viking.ttf` in the same folder as `ravenforge_v2.py`.
  Detected and registered automatically — no manual Windows font install needed.

**Icon preview is blank / shows rune placeholder**
→ Install Pillow: `pip install Pillow`
  Without Pillow, the chooser shows a rune placeholder but still sets the icon path.

**Build fails: `pyinstaller not found`**
→ RavenForge installs PyInstaller automatically before building.
  If it fails, run `pip install pyinstaller` manually and retry.

**`pystray` import error in console**
→ Tray icon support disabled. The build continues. Install with:
  `pip install pystray`

---

## 🤝 Related Projects

| Project | Description |
|---|---|
| [RavenMiner HQ](https://github.com/Raven-Black00/RavenAxe-BTCMiner-HQ) | Full ASIC mining dashboard & monitor |
| [VinylVixzen Etsy Shop](https://www.etsy.com/shop/VinylVixzen) | Esoteric embroidery & decals by Kathryn |

---

## 🧙 About the Author

Built with fire and runes by **Son of Odin**  
Former USMC RECON · Coder · Pagan · Miner

> *Huginn and Muninn — Thought and Memory — fly with every build.*

📧 [sonofodin@outlook.com](mailto:sonofodin@outlook.com)  
🐙 [github.com/Raven-Black00](https://github.com/Raven-Black00)

---

## ⚖️ License

MIT License — forge freely, credit the ravens. 🐦‍⬛

---

<p align="center">
  <em>ᚠᚢᚦᚨᚱᚲ — May your hashes flow true and your blocks be found</em>
</p>
