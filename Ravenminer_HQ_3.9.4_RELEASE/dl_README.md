# ᚱ RavenMiner HQ — v3.9.4

> *Huginn & Muninn watch the forge — Thought and Memory guard your hash.*

A Nordic-themed real-time mining dashboard for **KawPoW / Ravencoin** ASIC miners.
Connects directly to your miner's local API and displays live telemetry in a rich
Tkinter GUI adorned with Vegvisir, Valknut, and Elder Futhark rune sigils.

---

## ✨ Features

| Category | Details |
|---|---|
| **Hashrate** | Live TH/s display with animated colour-ramp bar graph |
| **Graph** | 40-point rolling history, shimmer wave animation, bright gold HR scale |
| **Temperatures** | ASIC + VR analogue arc gauges with colour band warnings |
| **Power** | Wattage, voltage, current, frequency, core voltage |
| **Fan** | Speed % + RPM live readout |
| **Shares** | Accepted / Rejected counts + rejection % |
| **Best Diff** | All-time session best difficulty |
| **Pool & Uptime** | Pool URL + miner uptime, gold pulse animation |
| **BTC Price** | Live Bitcoin USD price ticker |
| **Block Countdown** | Estimated next-block timer with animated progress bar |
| **Discord Alerts** | Webhook alerts: overheat, low hash, offline, block found |
| **System Tray** | Minimise to tray, restore on click |
| **Settings** | In-app settings window — IP, pool, Discord, alert thresholds |
| **Source Viewer** | Built-in syntax-highlighted source code viewer |
| **Config** | Auto-saved JSON config survives restarts |

---

## 🗂 File Layout

```
RavenMiner HQ v3.9.4/
├── Ravenminer_HQ_3.9.4.py          ← Main application
├── RavenMiner_BUILD_3.9.4.bat      ← Build forge (py → .exe)
├── requirements.txt                ← Python dependencies
├── ravenminer_config.json          ← Auto-created on first run
├── ravenminer_alerts.json          ← Auto-created on first run
├── ravenminer.ico                  ← (optional) Custom .exe icon
├── README.md                       ← This file
├── CHANGELOG.md                    ← Version history
└── INSTRUCTIONS.md                 ← Setup & usage guide
```

---

## 🚀 Quick Start

### Run from Python
```bash
pip install -r requirements.txt
python Ravenminer_HQ_3.9.4.py
```

### Build to .exe
Double-click **RavenMiner_BUILD_3.9.4.bat** and choose:
- `[1]` ONEFILE — single portable `.exe`
- `[2]` ONEDIR — folder build, instant startup

---

## ⚙️ Requirements

- Python 3.9+
- `requests` `Pillow` `pystray`
- Windows 10/11 (tray icon requires Windows; core GUI works on Linux/Mac)
- Miner accessible on local network via HTTP API

---

## 🔧 Configuration

Edit settings via the **⚙ gear icon** in the right panel or edit JSON directly:

```json
// ravenminer_config.json
{ "miner_ip": "192.168.68.100" }

// ravenminer_alerts.json
{
  "discord_webhook": "https://discord.com/api/webhooks/...",
  "alert_temp_threshold": 85.0,
  "alert_vr_temp_threshold": 85.0,
  "alert_hash_threshold": 0.5,
  "alert_on_block": true,
  "alert_on_offline": true
}
```

---

## 📜 Rune Palette

| Colour | Hex | Role |
|---|---|---|
| Gold Bright | `#f0c040` | Labels, titles, active values |
| Gold | `#c9a84c` | Secondary text |
| Purple Glow | `#9d5fff` | Accents, section headers |
| Cyan | `#00e5ff` | Frequency, WiFi |
| Green | `#00ff88` | OK shares |
| Red | `#ff3030` | Alerts, rejected shares |
| Orange | `#ff7700` | Warnings |

---

## 🪬 Credits

Built by **Son of Odin** — sonofodinoutlook.com  
GitHub: [RavenMiner HQ](https://github.com/Raven-Black00/RavenMiner-HQ)

*May your difficulty be low and your uptime eternal.*  
**ᚠ ᚢ ᚦ ᚨ ᚱ ᚲ ᚷ ᚹ ᚺ ᚾ ᛁ ᛃ ᛇ ᛈ ᛉ ᛊ ᛏ ᛒ ᛖ ᛗ ᛚ ᛜ ᛞ ᛟ**
