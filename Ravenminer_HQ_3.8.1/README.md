# Ravenminer_HQ_3.8.1

> *Son Of Odin  —  sonofodin@outlook.com*
> *ᛋᛟᚾ  ᛟᚠ  ᛟᛞᛁᚾ*

A dark Norse-themed real-time desktop dashboard for **Bitaxe / AxeOS** ASIC miners.
Live telemetry, animated gauges, Discord webhook alerts, runic aesthetics.

---

## Quick Start

```bash
pip install -r requirements.txt
python src/Ravenminer_HQ_3.8.1.py
```

---

## Build Standalone EXE

```
build.bat
```

Produces `dist\Ravenminer_HQ_3.8.1.exe` — single portable file, no Python needed.

---

## Features

| Category | Details |
|---|---|
| **Temperature** | ASIC & VR gauges — colour-zoned arcs (green/orange/red), ticks every 10°C |
| **Hashrate** | Live TH/s (4-digit) + 1m / 10m / 1h averages, animated bar chart history |
| **Power** | Wattage, input current/voltage, core voltage, frequency |
| **Hardware** | Fan %, fan RPM, WiFi RSSI, hostname, firmware version |
| **Mining** | Shares accepted/rejected, best difficulty, pool URL, uptime |
| **BTC Price** | Live Bitcoin price (right panel) |
| **Discord Alerts** | ASIC overheat, VR overheat, low hashrate, block found, offline, rejected shares |
| **Settings** | Full miner config — pools, thermal, fan, display, reboot slider |
| **System Tray** | Minimize to tray (requires pystray) |

---

## Gauge Colour Zones

| Gauge | Green | Orange | Red |
|---|---|---|---|
| ASIC | 0 – 55 °C | 55 – 70 °C | > 70 °C |
| VR   | 0 – 50 °C | 50 – 65 °C | > 65 °C |

---

## Discord Alerts Setup

1. Discord → Server Settings → Integrations → Webhooks → **New Webhook** → Copy URL
2. In Ravenminer_HQ → gear icon ⚙ → **DISCORD ALERTS**
3. Paste URL, set thresholds, toggle options
4. Click **▶ TEST WEBHOOK**
5. Click **APPLY SETTINGS**

Alert config is saved to `ravenminer_alerts.json` — never sent to the miner.

---

## Default Settings

| Setting | Default |
|---|---|
| Miner IP | 192.168.68.100 |
| Refresh Rate | 0.5 s |
| ASIC Alert Temp | 85 °C |
| VR Alert Temp | 85 °C |
| Hashrate Alert | 0.5 TH/s |

---

## Config Files

| File | Purpose |
|---|---|
| `ravenminer_config.json` | Miner IP address |
| `ravenminer_alerts.json` | Webhook URL, alert thresholds, toggles |

---

## Project Structure

```
Ravenminer_HQ_3.8.1/
├── src/
│   └── Ravenminer_HQ_3.8.1.py   ← main application
├── README.md
├── CHANGELOG.md
├── INSTRUCTIONS.md
├── requirements.txt
├── ravenminer_alerts.json        ← default alert config
├── build.bat                     ← double-click to build EXE
└── build.ps1                     ← build logic (called by build.bat)
```

---

## Rune Glossary

| Rune | Name | Meaning |
|---|---|---|
| ᛋ | Sowilo | Sun / Victory |
| ᛟ | Othala | Heritage / Home |
| ᚾ | Nauthiz | Need / Hardship |
| ᚠ | Fehu | Wealth / Cattle |
| ᛞ | Dagaz | Dawn / Day |
| ᛁ | Isaz | Ice / Stillness |
| ᚱ | Raidho | Journey / Ride |

---

*ᚠᛖᛚᛚ ᚠᛟᚱ ᚦᛖ ᛒᛚᛟᚲᚲ*
