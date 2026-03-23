# ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚴ — Setup & Usage Instructions  `v3.9.1`

---

## 1 · Installation

### Python
Download **Python 3.9+** from https://python.org  
✔ Tick **"Add Python to PATH"** during install on Windows.

```
python --version          # verify
```

### Dependencies
```
pip install requests Pillow pystray pyinstaller
```

| Package | Why |
|---|---|
| `requests` | Polls the miner REST API; sends Discord webhooks |
| `Pillow` | Renders Vegvisir watermark + Valknut animation |
| `pystray` | Minimise-to-tray icon — optional |
| `pyinstaller` | Build to .exe — optional, build-time only |

> **Linux only:** `sudo apt install python3-tk`

---

## 2 · First Run

```
python Ravenminer_HQ_3.9.1.py
```

The **Miner Setup Dialog** appears on first launch:

```
┌─────────────────────────────────────────┐
│  ᚱᚨᚡᛖᚱᚵᛖᚱᛖᚱ ᚺᛟᛃ                      │
│  Enter Miner IP Address                 │
│  ┌───────────────────────────────────┐  │
│  │  192.168.68.100                   │  │
│  └───────────────────────────────────┘  │
│          [ ✔  CONNECT ]                 │
└─────────────────────────────────────────┘
```

Enter your miner's local IP and press **Enter** or click **✔ CONNECT**.  
The IP is saved to `ravenminer_config.json` — you won't be asked again.

> **Tip:** Reserve a static DHCP lease for your miner so the IP never changes.

---

## 3 · Main Dashboard

```
┌──────────────────────────────────────────────────────────────────────────┐
│  ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚴ          [◉ LIVE]         [☾ DARK]  [⚙ Settings]  HH:MM:SS │
│                                                                      v3.9.1 │
├─────────────────────┬────────────────────────┬──────────────────────────────┤
│  LEFT PANEL         │  CENTRE PANEL          │  RIGHT PANEL                 │
│  ◈ ASIC temp gauge  │  Vegvisir watermark    │  ◈ VR temp gauge             │
│  ◈ Temp / Target    │  Valknut flash area    │  ◈ VR Temp                   │
│  ◈ Overheat limit   │  Hashrate TH/s (big)   │  ◈ Power / Current           │
│  ◈ Fan % / RPM      │  Hashrate history bars │  ◈ Voltage / Frequency       │
│  ◈ Shares OK / Bad  │  Best difficulty       │  ◈ Core Voltage              │
│  ◈ HR Graph (s)     │  Uptime / Pool         │  ◈ Wi-Fi RSSI                │
│  ◈ Refresh (s)      │  Block counter         │                              │
├─────────────────────┴────────────────────────┴──────────────────────────────┤
│  Updated: HH:MM:SS | SSID | Blocks: N   [Graph: 5s] [Refresh: 0.25s]  ESC  │
│  HOSTNAME | ASICModel | firmware                              ESC to quit   │
└──────────────────────────────────────────────────────────────────────────────┘
```

### Indicator Colours
| Colour | Meaning |
|---|---|
| 🟢 Green | Safe zone |
| 🟠 Orange | Approaching warning threshold |
| 🔴 Red | At or above critical threshold |

### Status Indicators
| Indicator | Meaning |
|---|---|
| ◉ **LIVE** (pulsing green) | Miner API responding normally |
| ◉ **OFFLINE** (solid red) | 1+ consecutive failed polls |

---

## 4 · Refresh Rates

Both entry boxes live in the **bottom bar**, right side:

```
[ countdown bar ←———————————————→ ]  [Graph (s)] [5.0]  [Refresh (s)] [0.25]
```

| Box | Default | Min | Controls |
|---|---|---|---|
| **Graph (s)** | 5.0 | 1.0 | Hashrate history bar-graph redraw frequency |
| **Refresh (s)** | 0.25 | 0.25 | All telemetry, gauges, labels, BTC price |

Type a new value and press **Enter** to apply immediately — no restart needed.

---

## 5 · Settings Panel

Click **⚙ Settings** (top-right) to open.  
The panel is two-column and **mouse-wheel scrollable**.

### Left Column — Miner Connection + Mining Params

| Field | Description |
|---|---|
| Miner IP Address | Enter new IP → **SAVE IP & RECONNECT** |
| Target Temp (°C) | PID temperature set-point sent to miner |
| Fan Speed (%) | Manual fan override |
| Frequency (MHz) | ASIC clock frequency |
| Core Voltage (mV) | ASIC core voltage |
| Stratum URL | Pool address (e.g. `public-pool.io:21496`) |
| Worker Name | Stratum worker identifier |
| Fallback pool | Secondary pool fields |

### Right Column — Discord Alerts + Reboot

| Field | Description |
|---|---|
| Discord Webhook URL | Paste from Discord channel → Integrations |
| Temp Threshold (°C) | ASIC overheat alert trigger |
| VR Temp Threshold (°C) | VR overheat alert trigger |
| Hash Threshold (TH/s) | Low hashrate alert trigger |
| Alert on Block Found | Toggle Discord ping on new block |
| Alert on Offline | Toggle Discord ping when miner goes offline |
| **Test Webhook** | Sends a test message immediately |
| **Save Alerts** | Persists all alert settings |
| **Safe Reboot** | Slide to right end + hold 2 s to reboot miner |

---

## 6 · Discord Alerts

**Alert types delivered to your webhook:**
- 🔥 ASIC overheat
- 🟠 VR overheat
- ⚠️ Low hashrate
- 🔴 Miner offline (3 consecutive failed polls)
- ⛏️ New block found
- ❌ Rejected-share spike (≥ 5 in one refresh)

**Setup:**
1. Discord server → channel → **⚙ Edit Channel → Integrations → Webhooks**
2. Create webhook → copy URL
3. Paste into **Settings → Discord Webhook URL → Save Alerts**
4. Click **Test Webhook** to confirm

---

## 7 · Building a Standalone .exe

1. Install PyInstaller: `pip install pyinstaller`
2. Double-click **`RavenMiner_BUILD_3.9.1.bat`**
3. Choose:

| Option | Output | Best for |
|---|---|---|
| **[1] ONEFILE** | Single `RavenMinerHQ.exe` (~20 MB) | Sharing / USB |
| **[2] ONEDIR** | Folder `RavenMinerHQ\` (fast cold start) | Permanent install |

Output lands in `dist\`.  
Place `ravenminer_config.json` and `ravenminer_alerts.json` next to the `.exe`.

---

## 8 · Keyboard Shortcuts

| Key | Action |
|---|---|
| `Esc` | Quit |
| Window close (✕) | Minimise to tray (if pystray installed) |
| `Enter` in Refresh boxes | Apply new refresh rate immediately |

---

## 9 · Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| **"Error: ..."** in status bar | Miner unreachable | Check IP, power, Wi-Fi |
| Gauges don't appear | Pillow not installed | `pip install Pillow` |
| No tray icon | pystray missing/unsupported | `pip install pystray` |
| Discord alerts not arriving | Wrong webhook URL | Re-paste URL, click Test |
| High CPU on macOS/Linux | Tkinter timer imprecision | Set Refresh to 1.0 s |
| `.exe` slow to start | ONEFILE unpacking to TEMP | Use ONEDIR build instead |

---

## 10 · Uninstall

Delete the `.py` / `.exe` (or ONEDIR folder) and the two JSON config files.  
No registry entries, no AppData folders — nothing left behind.

---

*ᚠᛖᚱᛞ ᚠᚱᛟᛗ ᛏᚺᛖ ᚱᚨᚡᛖᚾᛊ  —  Feed from the ravens.*
