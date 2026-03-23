# ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚴ — RavenMiner HQ  `v3.9.1`

```
  ██████╗  █████╗ ██╗   ██╗███████╗███╗   ██╗███╗   ███╗██╗███╗   ██╗███████╗██████╗
  ██╔══██╗██╔══██╗██║   ██║██╔════╝████╗  ██║████╗ ████║██║████╗  ██║██╔════╝██╔══██╗
  ██████╔╝███████║██║   ██║█████╗  ██╔██╗ ██║██╔████╔██║██║██╔██╗ ██║█████╗  ██████╔╝
  ██╔══██╗██╔══██║╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║╚██╔╝██║██║██║╚██╗██║██╔══╝  ██╔══██╗
  ██║  ██║██║  ██║ ╚████╔╝ ███████╗██║ ╚████║██║ ╚═╝ ██║██║██║ ╚████║███████╗██║  ██║
  ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝

       ᚺᚴ  —  Real-time ASIC Mining Dashboard  —  Python + Tkinter
```

> *"Huginn watches the hashrate.  Muninn remembers the blocks."*

---

## ✦ Features

| Category | Details |
|---|---|
| **Live Telemetry** | Hashrate (instant / 1m / 10m / 1h), temp, VR temp, power, fan, voltage, frequency — refreshes every **0.25 s** |
| **Dual Arc Gauges** | Animated ASIC temp + VR temp gauges with green/orange/red zones |
| **Hashrate History** | 200-point rolling bar graph, Hermite-eased interpolation, idle pulse animation — redraws every **5 s** (configurable) |
| **Block Counter** | Found-blocks tracker with full-screen gold flash + multi-tone alert on new block |
| **Bitcoin Countdown** | 10-minute block cycle progress bar |
| **BTC Price** | Live via CoinGecko (~60 s) |
| **Discord Alerts** | Overheat, VR overheat, low hashrate, offline, block found, rejected-share spike |
| **Settings Panel** | All miner params, fan, stratum, alert thresholds, safe slide-to-reboot |
| **Theme Toggle** | ☾ Dark (default) / ☀ Light — header button |
| **System Tray** | Minimise to tray (requires `pystray`) |
| **Norse Aesthetic** | Vegvisir watermark, Valknut flash, Elder Futhark rune header |
| **Version Label** | `vX.Y.Z` in bright gold under the live clock — driven by a single `VERSION` constant |

---

## ✦ Quick Start

```
pip install requests Pillow pystray
python Ravenminer_HQ_3.9.1.py
```

On first launch a setup dialog asks for your miner's IP address.
Enter it and press **Enter** — saved to `ravenminer_config.json`.

---

## ✦ Requirements

| Package | Purpose |
|---|---|
| Python 3.9+ | Runtime (3.14 recommended) |
| `requests` | HTTP API polling + Discord webhooks |
| `Pillow` | Vegvisir / Valknut image rendering |
| `pystray` | System-tray icon *(optional)* |
| `pyinstaller` | Build to .exe *(optional, build-time only)* |

> **Windows:** Tkinter ships with the python.org installer.  
> **Linux:** `sudo apt install python3-tk`

---

## ✦ Config Files

Both auto-created next to the `.exe` / `.py` on first run.

### `ravenminer_config.json`
```json
{ "miner_ip": "192.168.68.100" }
```

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

---

## ✦ Refresh Rates

Two independent timers, both live-editable in the bottom bar:

| Entry | Default | Controls |
|---|---|---|
| `Graph (s)` | 5.0 s | Hashrate history bar-graph redraw |
| `Refresh (s)` | 0.25 s | All telemetry, gauges, labels |

Minimum: Graph ≥ 1.0 s · Data ≥ 0.25 s

---

## ✦ Build to .exe

Double-click **`RavenMiner_BUILD_3.9.1.bat`** — choose ONEFILE or ONEDIR.  
Requires `pip install pyinstaller`.

---

## ✦ Project Files

```
Ravenminer_HQ_3.9.1.py          ← main application
RavenMiner_BUILD_3.9.1.bat      ← PyInstaller forge script
ravenminer_config.json           ← auto-created: miner IP
ravenminer_alerts.json           ← auto-created: alerts config
CHANGELOG.md
README.md
INSTRUCTIONS.md
```

---

## ✦ Licence

MIT — free for personal and commercial use.

---

*ᚠᛖᚱᛞ ᚠᚱᛟᛗ ᛏᚺᛖ ᚱᚨᚡᛖᚾᛊ  —  May your difficulty be low and your uptime eternal.*  ᚱ
