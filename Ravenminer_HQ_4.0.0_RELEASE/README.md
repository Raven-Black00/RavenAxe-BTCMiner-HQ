# ᚱᚨᚹᛖᚾᛗᛁᚾᛖᚱ ᚺᚴ

```
ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ ᚺ ᚾ ᛁ ᛃ ᛇ ᛈ ᛉ ᛊ ᛏ ᛒ ᛖ ᛗ ᛚ ᛜ ᛞ ᛟ
```

> *The ravens HUGINN and MUNINN carry the hashrate across the nine realms.*  
> *Where they land — profit follows.*

---

## ᚠᛖᚺᚢ — What Is RavenMiner HQ?

**RavenMiner HQ** is a desktop mining monitor and alert daemon for
[RavenMiner.com](https://ravenminer.com), forged in Python and sealed
with PyInstaller into a single `.exe` rune-stone.

It watches your workers, whispers when hashrate falls, and stands as
a silent sentinel in your system tray — like a raven perched on the
World Tree.

---

## ᚢᚱᚢᛉ — Requirements

| Rune | Dependency | Purpose |
|------|-----------|---------|
| ᚠ FEHU | Python 3.9+ | The serpent of Midgard |
| ᚨ ANSUZ | `requests` | Speaks to the pool API |
| ᚲ KENAZ | `Pillow` | Shapes the tray icon |
| ᚷ GEBO | `pystray` | Binds the tray spirit |
| ᛏ TIWAZ | PyInstaller | Forges the .exe |

Install all at once:

```bash
pip install -r requirements.txt
```

---

## ᚨᚾᛊᚢᛉ — Installation

**Clone the longhouse:**

```bash
git clone https://github.com/yourname/ravenminer-hq.git
cd ravenminer-hq
pip install -r requirements.txt
```

**Run from source:**

```bash
python Ravenminer_HQ_4.0.0.py
```

---

## ᚱᚨᛁᛞᛟ — Building the .exe

Double-click the forge script or run it from a terminal:

```
RavenMiner_BUILD_4.0.0.bat
```

ODINN will speak two paths to you:

```
 [1] ONEFILE  — Single rune-stone (.exe only)
     Portable as Gungnir. Unpacks to %TEMP% on launch.
     Cold start: 5–15 seconds.

 [2] ONEDIR   — Longhouse of runes (folder + .exe)
     Fast as Sleipnir. Instant startup, no unpacking.
     Best for permanent installs.

 [0] ABANDON  — Leave the forge cold.
```

The finished `.exe` lands in `dist\`.

---

## ᚲᛖᚾᚨᛉ — Configuration

On first run, two rune-scrolls are conjured automatically beside the `.exe`:

| File | Purpose |
|------|---------|
| `ravenminer_config.json` | Your wallet, pool, refresh interval |
| `ravenminer_alerts.json` | Hashrate thresholds, alert rules |

Edit them in any text editor. The watcher reads them live —
no restart required.

---

## ᚷᛖᛒᛟ — Features

- ᛊ **Live hashrate monitoring** — polls the RavenMiner API on your chosen interval
- ᛏ **Worker status dashboard** — see every rig at a glance
- ᚾ **Alert system** — desktop notification when a worker falls silent
- ᛜ **System tray daemon** — lives in the tray, out of your way
- ᛞ **Colour-coded status** — GREEN / GOLD / RED at a glance
- ᛟ **Zero cloud dependency** — everything runs local, nothing phoned home

---

## ᚹᚢᚾᛃᛟ — Colour Palette

These are the sacred colours of the forge — matching `Ravenminer_HQ_4.0.0.py`
and `RavenMiner_BUILD_4.0.0.bat` exactly:

| Name | Hex | Rune Role |
|------|-----|-----------|
| GOLD BRIGHT | `#f0c040` | Headers, primary text |
| GOLD | `#c9a84c` | Labels, prompts |
| PURPLE GLOW | `#9d5fff` | Section banners |
| PURPLE | `#7b2fff` | Abandon / neutral |
| CYAN | `#00e5ff` | In-progress steps |
| GREEN | `#00ff88` | Success `[OK]` |
| RED | `#ff3030` | Failure `[FAIL]` |
| ORANGE | `#ff7700` | Warning `[WARN]` |
| DIM | `#444466` | Metadata / notes |

---

## ᛏᛁᚹᚨᛉ — Troubleshooting

**Python not found**
> Add Python to your PATH. Tick *"Add Python to PATH"* during install at python.org.

**Defender flags the .exe**
> Expected on first run. A newly-forged, unsigned `.exe` draws Defender's eye.
> Allow it once — it will not ask again.

**pystray fails to import**
> The tray icon will be disabled. The rest of the forge continues unbroken.
> Install manually: `pip install pystray`

**ONEFILE cold-start is slow**
> That is Gungnir unpacking itself. It is normal. Use ONEDIR if speed matters.

**requirements.txt not found**
> HUGINN could not find the scroll. The forge will fall back to individual installs
> of `requests`, `Pillow`, and `pystray` automatically.

---

## ᛒᛖᚱᚲᚨᚾᛟ — Project Structure

```
ravenminer-hq/
├── Ravenminer_HQ_4.0.0.py       ← The great serpent
├── RavenMiner_BUILD_4.0.0.bat   ← The forge hammer
├── requirements.txt             ← The rune-dependency scroll
├── ravenminer.ico               ← The sigil (optional)
├── ravenminer_config.json       ← Auto-conjured on first run
├── ravenminer_alerts.json       ← Auto-conjured on first run
└── dist/                        ← The forged .exe lands here
    ├── RavenMinerHQ.exe              (ONEFILE build)
    └── RavenMinerHQ/                 (ONEDIR build)
        └── RavenMinerHQ.exe
```

---

## ᛗᚨᚾᚾᚨᛉ — Contributing

Pull requests are welcomed like gifts at the mead-hall.

1. Fork the repository
2. Branch from `main` — name it after a rune: `feature/dagaz-dark-mode`
3. Write your runes, test them
4. Open a pull request — describe what you forged and why

All code must pass the linter before the Allfather reviews it.

---

## ᛚᚨᚷᚢᛉ — License

MIT — free as the wind over Asgard.  
Use it, fork it, forge it anew. Give credit where the mead flows.

```
MIT License

Copyright (c) 2026 RavenMiner HQ Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```

---

## ᛞᚨᚷᚨᛉ — Version History

| Version | Rune | Notes |
|---------|------|-------|
| 4.0.0 | ᛞ DAGAZ | Current release — dawn of the new forge |
| 3.9.5 | ᛜ INGWAZ | Stability runes carved deep |
| 3.9.4 | ᛟ OTHALA | Foundation laid |

---

## ᛟᛞᛁᚾᚾ — Acknowledgements

- **ODIN** — for the wisdom of two watchful ravens
- **Thor** — whose hammer inspired the forge hammer
- **The RavenMiner pool** — for keeping the network honest
- **PyInstaller** — for sealing the serpent into a single stone
- **The Python community** — the World Tree upon which this perches

---

```
ᚠᛖᚺᚢ ᛏᛁᚹᚨᛉ ᛟᛞᛁᚾᚾ

  The EXE has been forged in Asgard.
  WUNJO INGWAZ DAGAZ OTHALA — Vegvisir points true.
  May your difficulty be low and your uptime eternal.

  R A V E N M I N E R  H Q   v 4 . 0 . 0

ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ — ᛏ ᛒ ᛗ — ᛜ ᛞ ᛟ
```
