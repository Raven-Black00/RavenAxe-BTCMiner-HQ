# ᚨ INSTALLATION GUIDE — RavenMiner HQ v3.9.3 ᚨ
> *Huginn and Muninn fly far — but first, the runes must be set.*

---

## ᚠ Prerequisites

| Requirement | Version | Notes |
|-------------|---------|-------|
| Python | 3.10+ | https://python.org — tick **Add to PATH** |
| pip | latest | bundled with Python |
| Windows | 10 / 11 | ANSI terminal required for build script |

---

## ᚢ Quick Start — Run from Source

```bash
# 1. Install dependencies
pip install -r requirements.txt

# 2. Run the dashboard
python Ravenminer_HQ_3.9.3.py
```

On **first launch**, a dialog will ask for your miner's IP address.
This is saved to `ravenminer_config.json` next to the script.

---

## ᚲ Build to .EXE (Windows)

Double-click **`RavenMiner_BUILD_3.9.3.bat`** and follow the forge prompts:

```
ᚠ  [1] ONEFILE  — Single portable .exe (5-15s cold start)
ᚢ  [2] ONEDIR   — Folder build, instant startup (recommended)
ᛜ  [0] ABANDON  — Leave the forge cold
```

The `.exe` will appear in the `dist\` folder.

> **Windows Defender note:** The first run may be scanned. This is normal for
> PyInstaller-built executables. Right-click → Run anyway if prompted.

---

## ᚦ Configuration Files

Two JSON files are auto-created on first run, next to the `.exe` or `.py`:

### `ravenminer_config.json`
```json
{
  "miner_ip": "192.168.68.100",
  "theme": "dark"
}
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

## ᚱ Discord Alerts Setup

1. In Discord: **Server Settings → Integrations → Webhooks → New Webhook**
2. Copy the webhook URL
3. Open RavenMiner HQ → click the ⚙ gear → paste URL in **Discord Webhook URL**
4. Click **APPLY SETTINGS**
5. Click **TEST WEBHOOK** to verify

---

## ᚺ Miner API Endpoint

RavenMiner HQ polls:
```
http://<MINER_IP>/api/system/info
```
every 0.25 seconds (configurable in the bottom bar).

Ensure your miner's web API is reachable from the machine running the dashboard.

---

## ᛏ Keyboard Shortcuts

| Key | Action |
|-----|--------|
| `Escape` | Quit |
| `Enter` (refresh/graph fields) | Apply new interval |

---

## ᛉ Troubleshooting

| Problem | Solution |
|---------|----------|
| `ModuleNotFoundError: PIL` | `pip install Pillow` |
| `ModuleNotFoundError: pystray` | `pip install pystray` (tray icon optional) |
| White box around gear icon | Already fixed in v3.9.3 |
| Miner shows OFFLINE | Check IP in settings, verify miner API is on |
| High CPU usage | Increase refresh interval (bottom bar) |
| Windows Defender flags .exe | Normal for PyInstaller — click "More info → Run anyway" |
