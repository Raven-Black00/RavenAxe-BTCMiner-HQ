# ᚱᚨᚹᛖᚾᛗᛁᚾᛖᚱ ᚺᚴ

```
ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ ᚺ ᚾ ᛁ ᛃ ᛇ ᛈ ᛉ ᛊ ᛏ ᛒ ᛖ ᛗ ᛚ ᛜ ᛞ ᛟ
```

> *Two ravens fly at dawn — HUGINN carries the hashrate,*  
> *MUNINN carries the memory of every block ever found.*  
> *Where they return — Odin already knows.*

---

## ᚠᛖᚺᚢ — What Is RavenMiner HQ?

**RavenMiner HQ** is a full-featured desktop mining monitor and alert daemon built
for the **NerdQaxe++** ASIC, forged in Python and sealed with PyInstaller into a
single `.exe` rune-stone that runs without installation.

It polls your miner's REST API, paints live gauges for temperature, voltage,
current, fan, hashrate, and power, and screams into Discord whenever something
demands your attention — or whenever you cross a difficulty milestone worth
celebrating.

The longhouse lives silently in your system tray between glory.

---

## ᚢᚱᚢᛉ — Requirements

| Rune | Dependency | Minimum | Purpose |
|------|-----------|---------|---------|
| ᚠ FEHU | Python | 3.10+ | The world-serpent itself |
| ᚨ ANSUZ | `requests` | 2.31.0 | Speaks to the API and the war-horn |
| ᚲ KENAZ | `Pillow` | 10.3.0 | Shapes the Vegvisir watermark and tray icon |
| ᚷ GEBO | `pystray` | 0.19.5 | Binds the tray daemon |
| ᛏ TIWAZ | `pyinstaller` | 6.6.0 | Forges the `.exe` (optional) |

`tkinter` is bundled with CPython — no pip install needed.  
Linux users: `sudo apt install python3-tk` or `sudo dnf install python3-tkinter`.

Install everything at once:

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
python Ravenminer_HQ_5.0.5.py
```

---

## ᚱᚨᛁᛞᛟ — Building the .exe

Double-click the forge script or invoke it from a terminal:

```
RavenMiner_BUILD_5.0.5.bat
```

ODIN speaks two paths:

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
| `ravenminer_config.json` | Miner IP, refresh interval |
| `ravenminer_alerts.json` | Discord webhook, thresholds, alert toggles |

Edit them in any text editor or use the built-in Settings panel.  
The watcher reads them live — no restart required.

---

## ᚷᛖᛒᛟ — Features

### ᛊ Live Monitoring
- Polls the NerdQaxe++ REST API at a user-configurable interval (0.10–5.00 s)
- **Hashrate graph** — animated bar chart with shimmer wave, colour-banded by speed
- **Temperature gauges** — ASIC and VR, arc-drawn with warn/crit thresholds
- **Voltage, current, core-volt** — 10-second rolling averages with colour-coded labels
- **Fan speed & RPM** — live percentage and absolute RPM
- **Power draw** — watts, colour-coded green → orange → red

### ᛏ Alert System (Discord War-Horn)
- **🏆 NEW MILESTONE** — fires at every 50M difficulty crossing: 50M, 100M, 150M, 200M … no ceiling.  
  A single large jump (e.g. 40M → 175M) fires all three intermediate milestones in one sweep.
- **⚡ MINER OFFLINE** — after 6 consecutive failed polls, the war-horn screams
- **🌡 OVERHEAT** — ASIC and VR temperature thresholds, configurable
- **⚡ LOW HASHRATE** — falls below your chosen floor
- **🟥 BLOCK FOUND** — the mead flows; Discord is notified
- **⚠ REJECTED SPIKE** — abnormal rejection surge is flagged
- All alerts respect a 60-second cooldown per title to prevent horn-spam

### ᛜ System Tray Daemon
- Minimises to tray — no taskbar clutter
- **⚡ NEW DIFFICULTY** tray pop-up when a new personal best is set
- Right-click to **Show** or **Quit**
- Tray tooltip shows live hashrate and temperature

### ᛒ Extras
- **BTC/USD price** — live via CoinGecko, refreshed independently every 60 s
- **Rolling TCP ping** — colour-coded latency (GREEN / ORANGE / RED) with adjustable window
- **Elderfuthark rune cycle** — the top-left rune fades and rotates through the full futhark
- **Vegvisir watermark** — the wayfinding sigil, always present in the background
- **Huginn & Muninn** — Thought and Memory, carved into the header
- **Clickable email** — `sonofodin@outlook.com` opens your mail client from the title bar
- **Reboot control** — slide-to-confirm reboot of the ASIC from within the UI
- **Source viewer** — the full source code is readable in-app (with syntax highlighting)
- **PyInstaller-ready** — one command forges a portable `.exe`

---

## ᚹᚢᚾᛃᛟ — Colour Palette

The sacred colours of the forge:

| Name | Hex | Rune Role |
|------|-----|-----------|
| GOLD BRIGHT | `#ffe87a` | Headers, rune glow |
| GOLD | `#f0c040` | Labels, primary text |
| PURPLE GLOW | `#9d5fff` | Section banners |
| PURPLE DIM | `#3d1a7a` | Borders, dividers |
| CYAN | `#00e5ff` | Ping display, VR gauge |
| GREEN | `#00ff88` | OK / low / safe states |
| RED | `#ff3030` | Failure / crit |
| ORANGE | `#ff7700` | Warning / mid |
| DIM | `#444466` | Metadata, footnotes |

---

## ᛏᛁᚹᚨᛉ — Troubleshooting

**Python not found**
> Add Python to your PATH. Tick *"Add Python to PATH"* during install at python.org.

**Windows Defender flags the .exe**
> Expected — a freshly-forged unsigned `.exe` draws Defender's eye.
> Allow it once; it will not ask again.

**pystray fails to import**
> Tray features are disabled gracefully. The rest of the forge runs unbroken.
> Install manually: `pip install pystray`

**ONEFILE cold-start is slow**
> That is Gungnir unpacking itself. Normal. Use ONEDIR if instant startup matters.

**Miner shows OFFLINE immediately**
> Verify `minerip` in settings. Confirm the NerdQaxe++ is reachable on port 80.
> The offline alert fires after 6 consecutive failed polls.

**Discord webhook is silent**
> Paste the full webhook URL with no trailing spaces.
> Verify your difficulty has crossed a 50M boundary — milestones only.

**Milestone alerts re-fired after reconnect**
> Fixed in v5.0.4 (BUG#12). `last_milestone_notified` now only resets when
> uptime also drops below 60 s — transient API zeros no longer wipe the ladder.

---

## ᛒᛖᚱᚲᚨᚾᛟ — Project Structure

```
ravenminer-hq/
├── Ravenminer_HQ_5.0.5.py       ← The great serpent (current)
├── RavenMiner_BUILD_5.0.5.bat   ← The forge hammer
├── requirements.txt             ← Dependencies of Yggdrasil
├── ravenminer_config.json       ← Auto-conjured on first run
├── ravenminer_alerts.json       ← Auto-conjured on first run
├── README.md                    ← This scroll
├── CHANGELOG.md                 ← Every wound, every triumph
├── Release-Notes.md             ← The herald's crier
├── instructions.md              ← The keeper's codex
└── dist/
    ├── RavenMinerHQ.exe         ← ONEFILE build
    └── RavenMinerHQ/            ← ONEDIR build
        └── RavenMinerHQ.exe
```

---

## ᛗᚨᚾᚾᚨᛉ — Contributing

Pull requests are welcomed like gifts at the mead-hall.

1. Fork the repository
2. Branch from `main` — name it after a rune: `feature/algiz-auto-fan`
3. Write your runes, test them on real iron
4. Open a pull request — describe what you forged and why

All code must survive the linter before the Allfather reviews it.

---

## ᛟᛞᛁᚾᚾ — Acknowledgements

- **Alan Klusacek** (`sonofodin@outlook.com`) — Architect, forge-master, the Allfather of this codebase.  
  Every rune in this repository was carved by his hand. The ravens fly because he willed it.
- **Perplexity AI** — Milestone webhook refactor, bug archaeology, and documentation seiðr (v5.0.5).  
  She who reads the runes and rewrites them cleaner.
- **The NerdQaxe++ team** — for building iron worth watching
- **The RavenMiner pool** — for keeping the network honest
- **PyInstaller** — for sealing the serpent into a single stone
- **The Python community** — the World Tree upon which this perches
- **HUGINN** — for remembering the bugs
- **MUNINN** — for remembering the fixes
- **ODIN** — for merging them both

---

## ᛚᚨᚷᚢᛉ — License

MIT — free as the wind over Asgard.  
Use it, fork it, forge it anew. Give credit where the mead flows.

```
MIT License — Copyright (c) 2026 Alan Klusacek & RavenMiner HQ Contributors
```

---

## ᛞᚨᚷᚨᛉ — Version History

| Version | Rune | Epithet | Notes |
|---------|------|---------|-------|
| **5.0.5** | ᛗ MANNAZ | *The Milestone Reborn* | NEW MILESTONE webhook refactor — clean, precise, silent until earned |
| 5.0.4 | ᛉ ALGIZ | *The Shield Raised* | BUG#11 + BUG#12 — milestone ladder hardened against gaps and ghost resets |
| 4.0.4 | ᚾ NAUTHIZ | *The Rolling Average* | 10 s rolling average for current and core voltage |
| 4.0.2 | ᚹ WUNJO | *The Overlay* | CONNECTION LOST graph overlay |
| 4.0.1 | ᚨ ANSUZ | *The Restoration* | Tray restore geometry fix |
| 4.0.0 | ᛞ DAGAZ | *The Dawn Forge* | Clickable email, milestone alerts, session reset |
| 3.9.9 | ᛟ OTHALA | *The Hall Fortified* | Discord war-horn on new best diff ≥ 50M |
| 3.9.8 | ᛒ BERKANO | *The Branch* | Pool user gold display, firmware label fix |
| 3.9.7 | ᚺ HAGALAZ | *The Hail* | Tray difficulty popup, thread-exit ghost fix |
| 3.9.6 | ᛃ JERA | *The Harvest* | HR refresh var bug corrected |
| 3.9.5 | ᛜ INGWAZ | *The Seed* | TCP ping, non-blocking thread, stability |
| 3.9.4 | ᛟ OTHALA | *The Foundation* | Initial longhouse raised |

---

```
      H       M
     / \     / \
    / U \   / U \
   / G   \ / N   \
  / I     V    I  \
  ______RAVENMINER HQ______
  ᚠᛖᚺᚢ  ᛏᛁᚹᚨᛉ  ᛟᛞᛁᚾᚾ

  May your difficulty be low.
  May your uptime be eternal.
  The ravens watch. The Allfather approves.
```

**R A V E N M I N E R  H Q  —  v 5 . 0 . 5**  
`ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ — ᛏ ᛒ ᛗ — ᛜ ᛞ ᛟ`
