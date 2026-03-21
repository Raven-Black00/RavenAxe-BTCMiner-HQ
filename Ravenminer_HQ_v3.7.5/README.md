# ᚱᚨᚁᛖᚾᛗᛁᚾᛖᚱ ᚺᚷᛃ — RavenMiner HQ

> A dark Norse-themed desktop dashboard for Bitaxe / AxeOS ASIC miners.  
> Real-time stats, Discord alerts, and runic aesthetics.

---

## Features

| Category | Details |
|---|---|
| **Temperature** | ASIC & VR gauges with colour-coded arcs, overheat limit & target temp |
| **Hashrate** | Live TH/s + 1m / 10m / 1h averages, animated bar history chart |
| **Power** | Wattage, input current, voltage, core voltage, frequency |
| **Hardware** | Fan speed %, fan RPM, WiFi RSSI, hostname, firmware version |
| **Mining** | Shares accepted/rejected, best difficulty, pool URL, uptime |
| **BTC Price** | Live Bitcoin price (right panel) |
| **Discord Alerts** | Webhook alerts for overheat, VR temp, low hashrate, block found, offline, rejected shares |
| **Settings** | Full miner config panel — pools, thermal, fan, display, reboot slider |
| **System Tray** | Minimizes to tray (requires pystray) |

---

## Requirements

- Python 3.10+ (tested on 3.14)
- See `requirements.txt`

---

## Installation

```bash
pip install -r requirements.txt
python ravenminer_hq_v3.7.5.py
```

---

## Building to .exe

```bash
build.bat
```

Produces `dist\ravenminer_hq_v3.7.5.exe` — single-file portable executable.

---

## Discord Alerts Setup

1. In Discord: **Server Settings → Integrations → Webhooks → New Webhook → Copy URL**
2. Open RavenMiner HQ → click the ⚙ gear icon → scroll to **DISCORD ALERTS**
3. Paste your webhook URL
4. Set thresholds (ASIC °C, VR °C, TH/s)
5. Toggle Block Found / Offline alerts on/off
6. Click **▶ TEST WEBHOOK** to verify
7. Click **✔ APPLY SETTINGS**

Alert settings are saved to `ravenminer_alerts.json` next to the executable.  
They are **never** sent to the miner API.

---

## Configuration Files

| File | Purpose |
|---|---|
| `ravenminer_config.json` | Miner IP address |
| `ravenminer_alerts.json` | Discord webhook URL and all alert thresholds |

---

## Default Miner IP

```
192.168.68.100
```

Change it in Settings → **MINER CONNECTION** → Save IP & Reconnect.

---

## Alert Reference

| Alert | Trigger | Discord Colour |
|---|---|---|
| 🔴 Miner Offline | 3 consecutive failed polls | Red |
| 🔥 ASIC Overheat | ASIC temp ≥ threshold | Red |
| 🟠 VR Overheat | VR temp ≥ threshold | Orange |
| ⚠️ Low Hashrate | Live TH/s < threshold | Amber |
| ⛏️ Block Found | New block detected | Green |
| ❌ Rejected Shares | 5+ rejections in one poll | Orange-Red |

---

## Credits

Built for the Bitaxe / AxeOS ecosystem.  
Norse runic glyphs use the Elder Futhark Unicode block (\u16A0–\u16FF).

---

*ᚠᛖᛚᛚ ᚠᛟᚱ ᚦᛖ ᛒᛚᛟᚲᚲ*
