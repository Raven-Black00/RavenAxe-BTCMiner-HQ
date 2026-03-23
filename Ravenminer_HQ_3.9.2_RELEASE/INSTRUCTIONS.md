# ᚦ RavenMiner HQ — Installation & Usage Instructions

---

## Method A — Run from Python source

### 1. Install Python
Download Python 3.9+ from [python.org](https://python.org).  
**Important:** tick *"Add Python to PATH"* during installation.

### 2. Install dependencies
Open a terminal in the `RavenMinerHQ_v3.9.2` folder and run:
```
pip install -r requirements.txt
```

### 3. Launch
```
python src/Ravenminer_HQ_3.9.2.py
```

---

## Method B — Build a standalone .exe (Windows)

### 1. Double-click `RavenMiner_BUILD_3.9.2.bat`

The forge script will:
- Check Python is available
- Install `requests`, `Pillow`, `pystray` from `requirements.txt`
- Install `PyInstaller` (build-time only)
- Offer two build modes:

| Mode | Description | Best for |
|---|---|---|
| **[1] ONEFILE** | Single `.exe`, unpacks to `%TEMP%` on launch | USB / sharing |
| **[2] ONEDIR** | Folder with `.exe` + support files, instant startup | Permanent install |

### 2. Output location
```
dist\RavenMinerHQ.exe               ← ONEFILE
dist\RavenMinerHQ\RavenMinerHQ.exe  ← ONEDIR
```

---

## First-Run Configuration

| Setting | How to change |
|---|---|
| **Miner IP** | Click ⚙ SETTINGS → enter IP → press Enter or click Apply |
| **Refresh rate** | Type seconds in the bottom-right "REFRESH s:" box, press Enter |
| **HR graph rate** | Type seconds in the "Graph (s)" box next to it, press Enter |
| **Theme** | Click ☾ DARK / ☀ LIGHT button — persists across restarts |
| **Discord alerts** | ⚙ SETTINGS → Alerts tab → paste webhook URL + set thresholds |

Config is saved automatically to:
```
ravenminer_config.json    ← IP, theme, refresh rates
ravenminer_alerts.json    ← Discord webhook + alert thresholds
```
Both files are created automatically on first run, next to the `.exe`.

---

## Discord Webhook Setup

1. In your Discord server, go to a channel → **Edit Channel → Integrations → Webhooks → New Webhook**
2. Copy the webhook URL
3. Open **⚙ SETTINGS** in RavenMiner HQ → paste URL into the Discord Webhook field
4. Set your desired thresholds and toggle which events send alerts
5. Click **Save Alerts**

---

## System Tray

- **Minimise** the window — it hides to the system tray (bottom-right clock area)
- **Left-click** the tray icon to restore the window
- **Right-click** the tray icon for Restore / Quit options

---

## Troubleshooting

| Symptom | Fix |
|---|---|
| *"Connecting…"* forever | Check miner IP in Settings; ensure miner is on same network |
| BTC price shows `--` | CoinGecko rate limit (free tier) — refreshes every ~60 s; wait a moment |
| `.exe` blocked by Defender | First-run SmartScreen warning is normal for unsigned builds; click *More info → Run anyway* |
| `ModuleNotFoundError: PIL` | Run `pip install Pillow` |
| `ModuleNotFoundError: pystray` | Run `pip install pystray` — tray is optional; app still works without it |
| Gauges always at 0 | Miner API may return `null` for some fields during warm-up; wait 30 s |

---

## Uninstall

Delete the `.exe` (or `RavenMinerHQ\` folder) and optionally the two `.json` config files.  
No registry entries are written by the Python script or PyInstaller output.
