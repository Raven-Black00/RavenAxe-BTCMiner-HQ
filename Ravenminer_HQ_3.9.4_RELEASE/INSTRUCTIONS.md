# ⚒ RavenMiner HQ — Setup & Usage Instructions

---

## 📦 Installation

### Step 1 — Install Python
Download Python 3.9+ from https://python.org  
☑ Tick **"Add Python to PATH"** during install.

### Step 2 — Install dependencies
Open a terminal in the folder containing the `.py` file and run:
```bash
pip install requests Pillow pystray
```
Or if a `requirements.txt` is present:
```bash
pip install -r requirements.txt
```

### Step 3 — Run the dashboard
```bash
python Ravenminer_HQ_3.9.4.py
```

---

## 🛠 Building a Standalone .exe

1. Place `RavenMiner_BUILD_3.9.4.bat` in the **same folder** as the `.py` file.
2. Double-click the `.bat` file.
3. Choose your build mode:

| Option | Name | Description |
|---|---|---|
| `1` | ONEFILE | Single `.exe` — portable, 5–15s cold start |
| `2` | ONEDIR | Folder build — instant start, needs its folder |
| `0` | ABANDON | Exit without building |

4. The `.exe` is placed in `dist\RavenMinerHQ.exe` (ONEFILE)
   or `dist\RavenMinerHQ\RavenMinerHQ.exe` (ONEDIR).

> **Tip:** Place an optional `ravenminer.ico` file next to the `.bat` to embed
> a custom icon in the `.exe`. The build script auto-detects it.

---

## ⚙️ First-Time Configuration

On first launch, two config files are auto-created next to the `.py` / `.exe`:

### `ravenminer_config.json`
```json
{ "miner_ip": "192.168.68.100" }
```
Change `miner_ip` to match your miner's local IP address, **or** use the
**Settings gear ⚙** in the app's right panel.

### `ravenminer_alerts.json`
```json
{
  "discord_webhook": "",
  "alert_temp_threshold": 85.0,
  "alert_vr_temp_threshold": 85.0,
  "alert_hash_threshold": 0.5,
  "alert_on_block": true,
  "alert_on_offline": true
}
```
Paste your **Discord webhook URL** to receive alerts.

---

## 🖥 Dashboard Layout

```
┌─────────────────────────────────────────────────────┐
│  ᚱ RavenMiner HQ              Son Of Odin   [clock] │
├──────────────┬──────────────────────┬───────────────┤
│  LEFT PANEL  │    CENTRE PANEL      │  RIGHT PANEL  │
│              │                      │               │
│  ASIC Gauge  │  Vegvisir watermark  │  Power (W)    │
│  VR Gauge    │  Live TH/s display   │  Current (A)  │
│  Voltage     │  1m / 10m / 1h AVG   │  Voltage (V)  │
│  Current     │  ┌─ Graph ─────────┐ │  Frequency    │
│              │  │ bars + grid     │ │  Core Volt    │
│              │  │ gold scale      │ │  Fan Speed    │
│              │  └─────────────────┘ │  Fan RPM      │
│              │  Shares OK/BAD/Diff  │  BTC Price    │
│              │  Pool  |  Uptime     │  WiFi RSSI    │
│              │                      │  Settings ⚙   │
├──────────────┴──────────────────────┴───────────────┤
│  [Next Block countdown bar]    REFRESH  GRAPH  LIVE │
└─────────────────────────────────────────────────────┘
```

---

## 🔔 Discord Alerts

| Alert | Trigger |
|---|---|
| 🌡 ASIC Overheat | Temp ≥ threshold (default 85°C) |
| 🌡 VR Overheat | VR temp ≥ threshold (default 85°C) |
| ⚡ Low Hashrate | Hash < threshold (default 0.5 TH/s) |
| 📴 Miner Offline | 3 consecutive failed polls |
| 🏆 Block Found | Detected on shares accepted jump |

> Alerts have a **60-second cooldown** per title to prevent spam.

---

## 🖱 UI Tips

- **Click the version label** (top-right) → opens GitHub page
- **Click the gear ⚙** (bottom of right panel) → opens Settings window
- **Minimise** → app hides to system tray
- **Right-click tray icon** → Show / Quit
- **Adjust Refresh / Graph intervals** via the bottom bar entry boxes + Enter
- **Slide the reboot slider** in Settings and hold 2s to reboot the miner

---

## 🆘 Troubleshooting

| Problem | Fix |
|---|---|
| `DATA LOSS` on graph | Miner unreachable — check IP & network |
| Window shows `--` everywhere | Waiting for first API response (normal, ~1s) |
| Tray icon missing | Install `pystray`: `pip install pystray` |
| Images/Vegvisir missing | Install `Pillow`: `pip install Pillow` |
| .exe flagged by Defender | First-run scan is normal; add exclusion if needed |
| Cold start slow (ONEFILE) | Normal — unpacks to TEMP. Use ONEDIR for speed |

---

*May your uptime be eternal and your rejected shares be zero.*  
**ᚠᛖᚺᚢ ᛏᛁᚹᚨᛉ ᛟᛞᛁᚾᚾ**
