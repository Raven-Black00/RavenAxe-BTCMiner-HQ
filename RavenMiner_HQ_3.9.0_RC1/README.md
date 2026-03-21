<!--
=============================================================================
  ██████╗  █████╗ ██╗   ██╗███████╗███╗   ██╗███╗   ███╗██╗███╗   ██╗███████╗██████╗
  ██╔══██╗██╔══██╗██║   ██║██╔════╝████╗  ██║████╗ ████║██║████╗  ██║██╔════╝██╔══██╗
  ██████╔╝███████║██║   ██║█████╗  ██╔██╗ ██║██╔████╔██║██║██╔██╗ ██║█████╗  ██████╔╝
  ██╔══██╗██╔══██║╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║╚██╔╝██║██║██║╚██╗██║██╔══╝  ██╔══██╗
  ██║  ██║██║  ██║ ╚████╔╝ ███████╗██║ ╚████║██║ ╚═╝ ██║██║██║ ╚████║███████╗██║  ██║
  ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
                    H Q   ᚱ   v 3 . 9 . 0   R C 1
=============================================================================
-->

<div align="center">

```
ᚱᚨᚢᛖᚾᛗᛁᚾᛖᚱ  ᚺᚴ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ᚠ ᚢ ᚦ ᚨ ᚱ ᚲ ᚷ ᚹ ᚺ ᚾ ᛁ ᛃ ᛇ ᛈ ᛉ ᛊ ᛏ ᛒ ᛖ ᛗ ᛚ ᛜ ᛞ ᛟ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
     ᚺᚢᚷᛁᚾᚾ  ·  ᛗᚢᚾᛁᚾᚾ  ·  ᛃᚷᚷᛞᚱᚨᛊᛁᛚ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

# 🪶 RavenMiner HQ — v3.9.0 RC1

### *Son of Odin · Bitaxe ASIC Miner Dashboard · Born in the forge of Asgard*

![Python](https://img.shields.io/badge/Python-3.9%2B-gold?style=for-the-badge&logo=python&logoColor=black)
![Platform](https://img.shields.io/badge/Platform-Windows-blueviolet?style=for-the-badge&logo=windows)
![License](https://img.shields.io/badge/License-MIT-brightgreen?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-RC1-orange?style=for-the-badge)

</div>

---

<div align="center">

```
  ᚠ  "Huginn watches your hashrate.
  ᚢ   Muninn remembers your blocks.
  ᚦ   Odin guards your uptime."
```

</div>

---

## ᚱ What Is RavenMiner HQ?

RavenMiner HQ is a **full-featured, Norse-themed desktop dashboard** for the
**AxeOS Bitaxe** ASIC miner family. Built entirely in Python + Tkinter — no
browser, no Electron, no bloat. Runs as a single `.py` or a compiled `.exe`.
Dark as the void between the nine worlds. Fast as Sleipnir.

---

## ᛏ Features

```
ᚠ LIVE MONITORING ──────────────────────────────────────────────────────────
  · Polls miner REST API every 0.5s (configurable)
  · Thread-safe data lock — no race conditions between poll & render threads
  · Miner offline detection with Discord alert (3 failed polls)

ᚢ TEMPERATURE GAUGES ───────────────────────────────────────────────────────
  · ASIC & VR arc gauges with colour-zoned tick labels and live readings
  · Green < warn  |  Orange warn–crit  |  Red crit+
  · ASIC zones: Green <55°C  Orange 55–69°C  Red 70°C+
  · VR zones:   Green <50°C  Orange 50–64°C  Red 65°C+

ᚦ HASHRATE ─────────────────────────────────────────────────────────────────
  · Live TH/s with 1m / 10m / 1h averages
  · Animated purple glow on the main reading
  · Segmented colour-graded history bar chart (last 40 data points)

ᚨ BTC PRICE ────────────────────────────────────────────────────────────────
  · Live CoinGecko price refresh every ~60s
  · Throttled to prevent API rate-limit bans

ᚱ NEXT BLOCK TIMER ─────────────────────────────────────────────────────────
  · 10-minute Bitcoin block estimate with animated progress bar

ᚲ DISCORD ALERTS ───────────────────────────────────────────────────────────
  · Webhook alerts: over-temp, hash-drop, block-found, miner offline
  · Per-alert enable/disable toggles
  · Live test button in Settings

ᚷ SETTINGS WINDOW ──────────────────────────────────────────────────────────
  · 2-column layout — 1240×780 — resizable
  · Left:  Miner IP · Mining · Main Pool · Fallback Pool
  · Right: Thermal & Fan · Display · Discord Alerts · Load/Apply · Reboot

ᚹ SYSTEM TRAY ──────────────────────────────────────────────────────────────
  · Minimise to tray icon (requires pystray)

ᚺ NORSE AESTHETIC ──────────────────────────────────────────────────────────
  · Embedded Vegvisir + Valknut PNG assets (base64, no external files)
  · Futhorc runic glyph title animations
  · Dark void background · Gold labels · Purple accents · Cyan metrics
```

---

## ᛃ Requirements

```
Python  3.9+
```

| Package    | Purpose                                           | Install         |
|------------|---------------------------------------------------|-----------------|
| `requests` | Miner API & CoinGecko HTTP calls                  | auto via .bat   |
| `Pillow`   | Renders embedded Vegvisir & Valknut artwork       | auto via .bat   |
| `pystray`  | System-tray icon when minimised                   | auto via .bat   |

```bash
pip install -r requirements.txt
```

---

## ᛇ Quick Start

```bash
# Clone
git clone https://github.com/Raven-Black00/RavenMiner_HQ.git
cd RavenMiner_HQ

# Install deps
pip install -r requirements.txt

# Run
python Ravenminer_HQ_3.9.0_RC1.py
```

> **Windows users:** Double-click `build_exe.bat` to forge a standalone
> `RavenMiner_HQ_3.9.0_RC1.exe` — no Python required to run it.

---

## ᛈ Build Standalone EXE

```
Double-click:  build_exe.bat
```

The forge script will:
1. Verify Python
2. Install `requests`, `Pillow`, `pystray`
3. Install `PyInstaller`
4. Compile to `dist\RavenMiner_HQ_3.9.0_RC1.exe`

Copy the `.exe` anywhere and run it. No Python needed.

---

## ᛉ First Run & Config Files

On first launch a setup dialog prompts for your miner IP.

| File                      | Contents                                |
|---------------------------|-----------------------------------------|
| `ravenminer_config.json`  | Miner IP address                        |
| `ravenminer_alerts.json`  | Discord webhook URL & alert thresholds  |

Both files are auto-created next to the `.exe` / `.py`.
Default miner IP: `192.168.68.100`

---

## ᛊ Default Alert Thresholds

| Alert                       | Default    |
|-----------------------------|------------|
| ASIC over-temperature       | 85 °C      |
| VR over-temperature         | 85 °C      |
| Hashrate drop               | < 0.5 TH/s |
| Block found notification    | ✅ Enabled  |
| Miner offline (3 bad polls) | ✅ Enabled  |

---

## ᛏ Colour Key

```
  ████  GOLD    — Labels, static UI, titles
  ████  PURPLE  — Hashrate, accents, Settings headers
  ████  CYAN    — VR metrics, live counters, refresh indicators
  ████  GREEN   — Normal / safe / OK
  ████  ORANGE  — Elevated / warning
  ████  RED     — Critical / error / overheat
```

---

## ᛒ Changelog Highlights (3.9.0 RC1)

```
  ᚠ  2-column Settings window (1240×780, resizable)
  ᚢ  Temperature gauge tick labels colour-zoned per threshold
  ᚦ  ASIC & VR readings match live gauge arc colour
  ᚨ  All descriptor labels changed to Gold
  ᚱ  threading.Lock guards all data between poll and render threads
  ᚲ  BTC price throttled to ~60s (prevents CoinGecko rate-limit bans)
```

> Full history → `CHANGELOG.md`

---

## ᛖ License

```
MIT — Free to use, modify, and distribute.
Born from the forge of Odin. Share the fire.
```

---

## ᛗ Acknowledgements

```
  ᚠ  AxeOS / Bitaxe    https://github.com/skot/ESP-Miner
  ᚢ  CoinGecko API     https://www.coingecko.com/en/api
  ᚦ  The Viking spirit of open-source hardware mining
```

---

<div align="center">

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ᚠ ᚢ ᚦ ᚨ ᚱ ᚲ ᚷ ᚹ ᚺ ᚾ ᛁ ᛃ ᛇ ᛈ ᛉ ᛊ ᛏ ᛒ ᛖ ᛗ ᛚ ᛜ ᛞ ᛟ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  RavenMiner HQ · Son of Odin
  github.com/Raven-Black00/RavenMiner_HQ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

</div>
