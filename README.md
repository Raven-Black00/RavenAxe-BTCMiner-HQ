# ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᛟᛋ — RavenMiner HQ

> *A real-time Bitcoin miner dashboard forged in the Norse tradition.*

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-Support%20this%20project-FFDD00?style=flat-square&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/alanklusacw)

![Python](https://img.shields.io/badge/Python-3.9%2B-blue?style=flat-square&logo=python)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-purple?style=flat-square)
![Theme](https://img.shields.io/badge/Theme-Nordic%20Rune-gold?style=flat-square)

---

## ⚡ Overview

**RavenMiner HQ** is a standalone desktop dashboard for AxeOS-based Bitcoin miners (e.g. **Bitaxe**).
Built entirely with Python + Tkinter — no browser, no web server, no dependencies beyond a few pip packages.

It combines live miner telemetry with a hand-crafted **Nordic rune aesthetic** — dark as a Scandinavian winter, gilded with Elder Futhark inscriptions and ancient Norse symbols.

---

## 🖥️ GUI Layout

The interface is divided into **three vertical columns** plus a **header** and **status bar**.

```
┌─────────────────────────────────────────────────────────────────────────┐
│  ᚾ  ꝚꞒⱣMꝚⱣMꝚMꝚ HᛟS        RAVENMINER | BM1370 | v1.0.x    08:38:10  │  ← Header
├──────────────────┬──────────────────────────────┬───────────────────────┤
│  ᛁᛏᛖ TEMPERATURES│      ᛈᚾᚱᛏᛁ HASHRATE          │  ᛈᛗᚺᚾ POWER & HARDWARE│
│                  │                              │                       │
│  ASIC TEMP       │   [ Valknut + Vegvisir ]     │  POWER                │
│  53.6 C          │                              │  116.8 W              │
│                  │      LIVE  6.509 TH/s        │                       │
│  VR TEMP         │           TH/s               │  INPUT CURR           │
│  42 C            │                              │  9.14 A               │
│                  │  ┌────────────────────────┐  │                       │
│  [ASIC GAUGE]    │  │  10m AVG │ 1h AVG │ 1d │  │  VOLTAGE              │
│                  │  └────────────────────────┘  │  12.91 V              │
│  [VR GAUGE]      │                              │                       │
│                  │  HASHRATE HISTORY (TH/s)     │  FREQUENCY            │
│  OVERHEAT LIMIT  │  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  │  800 MHz              │
│  75 C            │  (equalizer bar graph)       │                       │
│                  │                              │  CORE VOLT            │
│  TARGET TEMP     │  ┌──────┬────────┬────────┐  │  1269 mV              │
│  55 C            │  │SHARES│BAD SHR │BEST DIF│  │                       │
│                  │  └──────┴────────┴────────┘  │  FAN SPEED / RPM      │
│  REFRESH         │  [  ⟳  REBOOT MINER        ] │                       │
│  1 s             │                              │  BTC PRICE            │
│                  │  POOL / UPTIME               │  $71,866              │
│                  │                              │                       │
│                  │                              │  WiFi RSSI            │
│                  │                              │  -40 dBm              │
│                  │                              │                       │
│                  │                              │  ᛈ Ꝛ ᛗ ᛁ ᛏ           │
│                  │                              │  (PERMIT runes)       │
├──────────────────┴──────────────────────────────┴───────────────────────┤
│  NEXT BLOCK ESTIMATE  ~9m 09s  [progress bar]    TEST FLASH  REFRESH s: 1│
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 🎨 Nordic Aesthetic

| Element | Description |
|---------|-------------|
| **Vegvisir** | The Norse compass watermark glows behind the hashrate graph in the centre panel |
| **Valknut** | Odin's knot animates in the centre on every accepted share |
| **Elder Futhark Runes** | Column headers and labels use authentic Unicode runic characters |
| **Colour Palette** | Deep midnight `#080810` base, gold `#c9a84c` accents, violet `#7b2fff` highlights |
| **Dark / Light Toggle** | `☾ DARK` / `☀ LIGHT` button in the header swaps the full theme live |

---

## 📊 Hashrate Bar Graph

The centrepiece of the dashboard is a live **equalizer-style hashrate history graph**:

- **40 data groups × 16 sub-bars** rendered across the full width of the centre panel
- Each group **smoothstep-interpolates** toward the next data point, creating a flowing mountain silhouette
- Bar colours graduate from **deep blue at the base** to **bright violet at the top**
- When hashrate reaches **≥ 6.5 TH/s**, the top segment of that bar turns **bright green** (`#00ff88`)
- Bars are rendered with **stipple transparency** so the Vegvisir watermark shows through
- When no new data arrives for 3+ seconds, a **gentle sine wave pulse** animates the bars in idle mode
- A **power curve** and **deterministic jitter** keep the graph visually lively even during stable hashrate periods

---

## 🛠️ Features

- ⚡ **Live telemetry** — hashrate, ASIC temp, VR temp, power, current, voltage, frequency, core voltage, fan speed, fan RPM, WiFi RSSI
- 📈 **Averaging** — 10-minute, 1-hour, and 1-day rolling hashrate averages
- 🌡️ **Dual gauges** — animated arc gauges for ASIC and VR temperatures
- 🟢 **Share tracking** — accepted shares, rejected shares, best difficulty
- ₿ **Bitcoin price** — live via CoinGecko free API
- ⏱️ **Block countdown** — estimated time to next Bitcoin block with animated progress bar
- 🔁 **Auto-refresh** — configurable refresh rate (enter seconds in bottom-right entry box)
- 🔄 **Reboot button** — one-click miner restart with confirmation dialog
- 🌗 **Theme toggle** — full dark/light theme switch, no restart needed
- 🖥️ **System tray** — minimizes to tray; right-click to restore or quit
- 🚨 **Block alert** — fullscreen flash effect when a new block is found
- ⌨️ **ESC to quit**

---

## ⚙️ Configuration

Open `ravenminer_hq_updated.py` and set your miner's local IP address:

```python
MINER_IP = "192.168.68.100"   # ← change to your miner's IP
REFRESH  = 1                   # ← default refresh interval in seconds
```

Adjust the green-top hashrate threshold:

```python
high_hr = val >= 6.5   # ← change 6.5 to your target TH/s
```

---

## 🚀 Quick Start

```bash
# 1. Clone the repo
git clone https://github.com/yourname/ravenminer-hq.git
cd ravenminer-hq

# 2. Install dependencies
pip install -r requirements.txt

# 3. Run
python ravenminer_hq_updated.py
```

---

## 📦 Build Executable

### Windows
```bash
build_windows.bat
# Output: dist\RavenMinerHQ.exe
```

### macOS / Linux
```bash
chmod +x build_macos.sh && ./build_macos.sh
# Output: dist/RavenMinerHQ
```

---

## 📋 Requirements

| Package | Purpose |
|---------|---------|
| `requests` | Miner API + CoinGecko polling |
| `Pillow` | Vegvisir image rendering + tray icon |
| `pystray` | System tray support |
| `pyinstaller` | Build standalone executable |

---

## 🪬 Lore

> *Huginn and Muninn fly each day over the spacious earth. I fear for Huginn, that he come not back, yet more anxious am I for Muninn.*
> — Grímnismál, stanza 20

The ravens **Huginn** (Thought) and **Muninn** (Memory) are Odin's messengers — watching over the world and returning with knowledge. RavenMiner HQ watches over your miner in the same spirit.

---

## 📄 License

MIT — free to use, modify and distribute.
