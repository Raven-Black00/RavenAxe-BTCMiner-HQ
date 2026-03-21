# RavenMiner HQ v3.8.0

> A dark Norse-themed desktop dashboard for Bitaxe / AxeOS ASIC miners.
> Real-time stats, Discord alerts, and runic aesthetics.
>
> *Son Of Odin  -- sonofodin@outlook.com*

---

## Features

| Category | Details |
|---|---|
| **Temperature** | ASIC & VR gauges with colour-coded arcs, overheat limit & target temp |
| **Hashrate** | Live TH/s (4-digit format) + 1m / 10m / 1h averages, animated bar history |
| **Power** | Wattage, input current, voltage, core voltage, frequency |
| **Hardware** | Fan speed %, fan RPM, WiFi RSSI, hostname, firmware version |
| **Mining** | Shares accepted/rejected, best difficulty, pool URL, uptime |
| **BTC Price** | Live Bitcoin price display |
| **Discord Alerts** | ASIC overheat, VR overheat, low hashrate, block found, offline, rejected shares |
| **Settings** | Full miner config — pools, thermal, fan, display, reboot slider |
| **System Tray** | Minimizes to tray (requires pystray) |

---

## Requirements

- Python 3.10+ (tested on 3.14)
- See requirements.txt

---

## Quick Start

```bash
pip install -r requirements.txt
python ravenminer_hq_v3.8.0.py
```

---

## Build to EXE

```bash
build.bat
```

Produces dist\ravenminer_hq_v3.8.0.exe as a single portable executable.

---

## Discord Alerts Setup

1. Discord: Server Settings > Integrations > Webhooks > New Webhook > Copy URL
2. Open RavenMiner HQ > click gear icon > scroll to DISCORD ALERTS
3. Paste webhook URL
4. Set thresholds: ASIC temp, VR temp, hashrate (TH/s)
5. Toggle Block Found / Offline alerts
6. Click TEST WEBHOOK to verify
7. Click APPLY SETTINGS

Alert settings are saved to ravenminer_alerts.json next to the executable.
They are never sent to the miner API.

---

## Configuration Files

| File | Purpose |
|---|---|
| ravenminer_config.json | Miner IP address |
| ravenminer_alerts.json | Discord webhook URL and all alert thresholds/toggles |

---

## Default Settings

| Setting | Default |
|---|---|
| Miner IP | 192.168.68.100 |
| Refresh Rate | 0.5 seconds |
| ASIC Alert Temp | 85 deg C |
| VR Alert Temp | 85 deg C |
| Hashrate Alert | 0.5 TH/s |

---

## Alert Reference

| Alert | Trigger | Colour |
|---|---|---|
| MINER OFFLINE | 3 consecutive failed polls | Red |
| ASIC OVERHEAT | ASIC temp >= threshold | Red |
| VR OVERHEAT | VR temp >= threshold | Orange |
| LOW HASHRATE | Live TH/s < threshold | Amber |
| BLOCK FOUND | New block detected | Green |
| REJECTED SHARES | 5+ rejections in one poll | Orange-Red |

---

## Rune Reference

| Rune | Letter | Name |
|---|---|---|
| ᛋ | S | Sowilo |
| ᛟ | O | Othala |
| ᚾ | N | Nauthiz |
| ᚠ | F | Fehu |
| ᛞ | D | Dagaz |
| ᛁ | I | Isaz |

---

*ᚠᛖᛚᛚ ᚠᛟᚱ ᚦᛖ ᛒᛚᛟᚲᚲ*
