# Ravenminer_HQ_3.8.1 — Setup & Usage Guide

---

## Requirements

- **Windows 10 / 11**
- **Python 3.10+** → https://python.org/downloads
  - During install: tick **"Add Python to PATH"**
- A **Bitaxe miner** running AxeOS on your local network

---

## Installation

### 1 — Place the project folder
```
Ravenminer_HQ_3.8.1\
    src\Ravenminer_HQ_3.8.1.py
    requirements.txt
    build.bat
    build.ps1
```

### 2 — Install dependencies
Open a terminal inside the project folder:
```
pip install -r requirements.txt
```

### 3 — Run
```
python src\Ravenminer_HQ_3.8.1.py
```

On first launch a settings dialog opens — enter your miner IP and click **APPLY SETTINGS**.

---

## Finding Your Miner IP

1. Open your router admin page (usually `http://192.168.1.1` or `http://192.168.68.1`)
2. Find a device named **Bitaxe** or similar
3. Copy its IP (e.g. `192.168.68.100`)
4. Paste into Ravenminer_HQ → ⚙ Settings → **MINER IP**

---

## Discord Alerts

1. Discord → your server → **Server Settings** → **Integrations** → **Webhooks**
2. **New Webhook** → name it → **Copy Webhook URL**
3. In Ravenminer_HQ click ⚙ gear icon
4. Scroll to **DISCORD ALERTS**
5. Paste webhook URL
6. Set thresholds:
   - ASIC Overheat °C (recommended: 70)
   - VR Overheat °C (recommended: 65)
   - Low Hashrate TH/s (your expected minimum)
7. Toggle Block Found / Offline alerts
8. Click **▶ TEST WEBHOOK** to verify
9. Click **APPLY SETTINGS**

Settings saved to `ravenminer_alerts.json`.

---

## Build EXE

Double-click `build.bat`.

The script will:
1. Verify Python is installed
2. Run `pip install -r requirements.txt`
3. Create `ravenminer_alerts.json` if missing
4. Clean any previous build artifacts
5. Run PyInstaller → output: `dist\Ravenminer_HQ_3.8.1.exe`

The EXE is a single portable file — no Python required to run it.

---

## UI Controls

| Control | Action |
|---|---|
| ⚙ Gear icon | Open settings |
| ☾ DARK button | Toggle dark/light theme |
| Refresh slider | Adjust live polling interval |
| Reboot slider | Hold 2 s to reboot miner |
| System tray icon | Minimise to tray |

---

## Troubleshooting

| Problem | Fix |
|---|---|
| "Connection refused" error | Check miner IP in settings. Confirm miner is online |
| Blank / frozen display | Miner may be rebooting — auto-reconnects |
| Discord alerts not firing | Use TEST WEBHOOK. Check thresholds are not zero |
| EXE won't open | Run from cmd to see errors: `dist\\Ravenminer_HQ_3.8.1.exe` |
| Runes showing as squares | Requires Segoe UI font (built in to Windows 10/11) |

---

## GitHub Push (first time)

```bash
git init
git add .
git commit -m "Initial release — Ravenminer_HQ_3.8.1"
git remote add origin https://github.com/YOUR_USERNAME/Ravenminer_HQ_3.8.1.git
git push -u origin main
```

---

*Son Of Odin  —  ᛋᛟᚾ  ᛟᚠ  ᛟᛞᛁᚾ*
*ᚠᛖᛚᛚ ᚠᛟᚱ ᚦᛖ ᛒᛚᛟᚲᚲ*
