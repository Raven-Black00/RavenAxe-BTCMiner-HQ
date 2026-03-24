# ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚲ — RavenMiner HQ

```
  ██████╗  █████╗ ██╗   ██╗███████╗███╗   ██╗███╗   ███╗██╗███╗   ██╗███████╗██████╗
  ██╔══██╗██╔══██╗██║   ██║██╔════╝████╗  ██║████╗ ████║██║████╗  ██║██╔════╝██╔══██╗
  ██████╔╝███████║██║   ██║█████╗  ██╔██╗ ██║██╔████╔██║██║██╔██╗ ██║█████╗  ██████╔╝
  ██╔══██╗██╔══██╗╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║╚██╔╝██║██║██║╚██╗██║██╔══╝  ██╔══██╗
  ██║  ██║██║  ██║ ╚████╔╝ ███████╗██║ ╚████║██║ ╚═╝ ██║██║██║ ╚████║███████╗██║  ██║
  ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
                              H  Q   —   v 3 . 9 . 3
```

> *Two ravens fly at the Allfather's shoulder — Huginn carries Thought, Muninn carries Memory.*
> *One watches your hashrate. One watches your temperature.*
> *Neither sleeps.*

---

## ᚦ What is RavenMiner HQ?

**RavenMiner HQ** is a real-time Bitcoin mining dashboard built for the
**AvalonMiner / RavenMiner** family of ASIC miners. It monitors your miner
over the local network API and presents all critical data in a dark, Norse-themed
Tkinter GUI — with runic motifs, Vegvisir watermarks, Valknut animations, and
gold-on-purple aesthetics drawn from the Elder Futhark and Slavic symbolism.

---

## ᚨ Features

### ᛏ Real-Time Monitoring
- **Hashrate** — live TH/s with animated electric-blue pulse glow
- **Hashrate History Graph** — 40-bar animated chart; bars below 6.4 TH/s turn red
- **ASIC & VR Temperature** — gauge arcs with colour-coded needle (green / orange / red)
- **Power** — Green 0–119W · Orange 120–129W · Red 130W+
- **Input Current** — Green 0–9.9A · Orange 10–11.9A · Red 12A+
- **Voltage** — Red <12V · Orange 11.99–12V · Green 12–12.8V · Orange >12.8V warning
- **Fan Speed & RPM** — colour-coded
- **WiFi RSSI** — signal strength colour coding
- **Shares OK / BAD / Best Diff** — large 22pt bold font with rejection % label
- **BTC Price** — live via CoinGecko API (~60s updates)
- **Pool & Uptime** — gold pulsing labels
- **Next Block Countdown** — animated progress bar

### ᚠ Alerts (Discord Webhooks)
- ASIC & VR overheat alert
- Low hashrate alert
- Block found notification
- Miner offline (3 consecutive failed polls)
- **60-second cooldown** per alert type — no flooding

### ᚢ UI & Aesthetics
- **Vegvisir** animated watermark (centre panel)
- **Valknut** flash animation on each new accepted share
- **Huginn & Muninn** ravens — brighten with warm gold shimmer on every share
- **Block Found** full-screen flash with Norse rune overlay + audio beep
- **◉ LIVE / ◉ OFFLINE** pulsing indicator (bottom bar)
- **Light / Dark** theme toggle
- **System tray** icon — show / hide / quit (pystray)
- **Source Code Viewer** — built-in syntax-highlighted browser with live search
- **Hi-res 3D gear** settings button with golden glow ring on hover

### ⚙ Settings & Control
- Miner IP (saved to JSON, persists across restarts)
- Thermal limits, target temp, fan control, frequency, core voltage
- Discord webhook URL + per-alert thresholds
- Reboot slider guard (2-second hold to confirm)
- Adjustable refresh rate (0.5s – 60s)
- Adjustable graph refresh rate

---

## ᚱ Quick Start

```bash
pip install -r requirements.txt
python Ravenminer_HQ_3.9.3.py
```

See **[INSTALL.md](INSTALL.md)** for full setup, `.exe` build instructions,
Discord alert configuration, and troubleshooting.

---

## ᛜ File Structure

```
RavenMiner_HQ_v3.9.3_RELEASE/
│
├── Ravenminer_HQ_3.9.3.py         ← Main program (run this)
├── RavenMiner_BUILD_3.9.3.bat     ← Build to .exe (Windows, Norse-themed forge)
├── requirements.txt               ← Python runtime dependencies
├── README.md                      ← This file
├── INSTALL.md                     ← Full installation & configuration guide
├── CHANGELOG.md                   ← Complete version history
│
├── src/
│   └── Ravenminer_HQ_3.9.3.py    ← Source copy (used by PyInstaller)
│
└── (auto-created at first run)
    ├── ravenminer_config.json     ← Miner IP + theme preference
    └── ravenminer_alerts.json     ← Discord webhook + alert thresholds
```

---

## ᚲ Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `requests` | ≥2.28 | Miner API · Discord webhooks · BTC price |
| `Pillow` | ≥9.0 | Vegvisir · Valknut · Ravens · Gear image |
| `pystray` | ≥0.19 | System tray icon (optional — graceful fallback) |
| `tkinter` | built-in | GUI framework |

---

## ᚺ Miner Compatibility

Tested with **AvalonMiner A14** series running **RavenMiner** firmware.

API endpoint polled: `http://<MINER_IP>/api/system/info`

---

## ᛞ Credits & Attribution

**Developed by:** Son Of Odin — sonofodinoutlook.com

**Settings gear icon:**
> 3D coin gear icon by pngtree.com
> [png image from pngtree.com](https://pngtree.com/freepng/3d-of-coins-gear-make-people-finish-work-concept_18202979.html)
> Used under the pngtree free license. All rights remain with the original creator.

**Norse / Slavic symbolism:**
- **Vegvisir** — Old Norse compass rune, the Wayfinder through storms
- **Valknut** — The knot of the slain, symbol of Odin
- **Elder Futhark** — ᚠᚢᚦᚨᚱᚲᚷᚹᚺᚾᛁᛃᛇᛈᛉᛊᛏᛒᛖᛗᛚᛜᛞᛟ
- **Huginn & Muninn** — Odin's ravens, Thought and Memory

---

## ᚾ License

MIT License — free to use, modify, and distribute.
Attribution appreciated but not required.

---

*May your difficulty be low and your uptime eternal.*
*ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚲ — The ravens watch.* 🐦‍⬛🐦‍⬛
