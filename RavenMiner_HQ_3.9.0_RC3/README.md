# ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚴ — RavenMiner HQ

> *"The ravens Huginn and Muninn fly each day over the spacious earth.  
> I fear for Huginn, that he come not back, yet more anxious am I for Muninn."*  
> — Grímnismál

**RavenMiner HQ** is a real-time desktop dashboard for AxeOS-compatible  
Bitcoin ASIC miners (Bitaxe, NerdAxe, etc.). Built with Python + Tkinter,  
it requires no browser and runs natively on Windows, macOS, and Linux.

---

## ✦ Features

| Category | Details |
|---|---|
| **Live Telemetry** | Hashrate (instant / 1 m / 10 m / 1 h), temperature, VR temp, power, fan speed, voltage, frequency |
| **Dual Gauges** | Animated arc gauges for ASIC temp and VR temp with green/orange/red zones |
| **Hashrate History** | Rolling 200-point segmented bar graph with Hermite-eased interpolation and idle pulse animation |
| **Block Counter** | Found blocks tracker with full-screen gold flash + sound alert on new block |
| **Bitcoin Countdown** | 10-minute block cycle countdown bar |
| **BTC Price** | Live price via CoinGecko (~60 s refresh) |
| **Discord Alerts** | Configurable webhooks for overheat, low hashrate, offline, block found, rejected-share spike |
| **Settings Panel** | Miner params, fan, stratum URL, alert thresholds — written back to the miner via its REST API |
| **Safe Reboot** | Slide-to-confirm + 2 s hold reboot button — prevents accidental clicks |
| **Theme Toggle** | Dark (default) / Light mode via header button |
| **System Tray** | Minimises to tray (requires `pystray`) |
| **Norse Aesthetic** | Vegvisir watermark, Valknut flash animation, Elder Futhark runes in the header |

---

## ✦ Requirements

| Package | Purpose | Install |
|---|---|---|
| Python 3.9+ | Runtime | python.org |
| `requests` | HTTP API polling + Discord webhooks | `pip install requests` |
| `Pillow` | Vegvisir / Valknut image rendering | `pip install Pillow` |
| `pystray` | System-tray icon *(optional)* | `pip install pystray` |
| `pyinstaller` | Build to .exe *(optional)* | `pip install pyinstaller` |

> **Tkinter** ships with the standard Python installer on Windows.  
> On Linux: `sudo apt install python3-tk`

Install everything at once:

```
pip install requests Pillow pystray pyinstaller
```

---

## ✦ Quick Start

1. **Run from source**
   ```
   python Ravenminer_HQ_3.9.0_fixed.py
   ```
   On first launch a setup dialog asks for your miner's IP address.  
   The IP is saved to `ravenminer_config.json` next to the script — you won't  
   be asked again unless the file is deleted.

2. **Build a standalone .exe** (Windows)  
   Double-click `build_ravenminer.bat` and follow the Norse-themed prompts.  
   Choose **ONEFILE** for a single portable `.exe` or **ONEDIR** for a folder  
   that loads faster on each launch.

---

## ✦ Configuration Files

Both files are created automatically on first run if they don't exist.  
They sit in the **same directory as the `.exe` or `.py`** — never in AppData.

### `ravenminer_config.json`
```json
{
  "miner_ip": "192.168.68.100"
}
```
Change the IP inside the app via **Settings → Miner IP** or edit this file  
directly and restart.

### `ravenminer_alerts.json`
```json
{
  "discord_webhook": "https://discord.com/api/webhooks/...",
  "alert_temp_threshold": 85.0,
  "alert_vr_temp_threshold": 85.0,
  "alert_hash_threshold": 0.5,
  "alert_on_block": true,
  "alert_on_offline": true
}
```
All alert settings are editable in the **Settings** panel — no manual file  
editing needed.

---

## ✦ Discord Webhook Setup

1. Open your Discord server → channel settings → **Integrations → Webhooks**
2. Create a new webhook, copy the URL
3. Paste it into **Settings → Discord Webhook URL** in the app
4. Click **Save Alerts** — alerts are active immediately

**Alert types:**
- 🔥 ASIC overheat (configurable °C threshold)
- 🟠 VR overheat (configurable °C threshold)
- ⚠️ Low hashrate (configurable TH/s floor)
- 🔴 Miner offline (3 consecutive failed polls)
- ⛏️ Block found
- ❌ Rejected share spike (≥ 5 in one refresh)

---

## ✦ Keyboard Shortcuts

| Key | Action |
|---|---|
| `Esc` | Quit |
| Window close (✕) | Minimise to tray (if pystray installed) |

---

## ✦ Project Structure

```
Ravenminer_HQ_3.9.0_fixed.py   ← main application
ravenminer_config.json          ← auto-created: miner IP
ravenminer_alerts.json          ← auto-created: Discord / alert config
build_ravenminer.bat            ← PyInstaller build script (Windows)
CHANGELOG.md                    ← version history
README.md                       ← this file
INSTRUCTIONS.md                 ← detailed setup & usage guide
```

---

## ✦ Licence

MIT — free for personal and commercial use.  
Attribution appreciated but not required.

---

*Huginn watches the hashrate. Muninn remembers the blocks.*  
*May your difficulty always be low and your uptime eternal.* ᚱ
