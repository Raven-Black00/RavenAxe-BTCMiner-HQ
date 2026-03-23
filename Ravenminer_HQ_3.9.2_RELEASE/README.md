# ᚠ RavenMiner HQ v3.9.2

[![Version](https://img.shields.io/badge/version-v3.9.2-blueviolet)]()
[![Python](https://img.shields.io/badge/python-3.9%2B-blue)]()
[![Platform](https://img.shields.io/badge/platform-Windows-lightgrey)]()

Real-time Norse-themed mining dashboard for RavenMiner-compatible hardware.

---

## Quick Start

### Run from source
```
pip install -r requirements.txt
python src/Ravenminer_HQ_3.9.2.py
```

### Build a standalone .exe
```
RavenMiner_BUILD_3.9.2.bat
```
Choose **[1] ONEFILE** for a single portable `.exe` or **[2] ONEDIR** for fastest startup.

---

## First-Run Setup

On first launch the app connects to `192.168.68.100` (default miner IP).  
To change it, click **⚙ SETTINGS** in the dashboard and enter your miner's IP.  
Settings are saved to `ravenminer_config.json` next to the `.exe`.

---

## File Layout

```
RavenMinerHQ_v3.9.2/
├── src/
│   └── Ravenminer_HQ_3.9.2.py      ← main application
├── README.md
├── INTRODUCTION.md
├── CHANGELOG.md
├── INSTRUCTIONS.md
├── requirements.txt
└── RavenMiner_BUILD_3.9.2.bat      ← build script (Windows)
```

Runtime config files (auto-created next to the `.exe` on first run):
- `ravenminer_config.json` — miner IP, theme, refresh rates
- `ravenminer_alerts.json` — Discord webhook URL and alert thresholds

---

## Discord Alerts

Open **⚙ SETTINGS → Alerts** and paste your Discord webhook URL.  
Supported triggers:

| Alert | Default threshold |
|---|---|
| Miner offline | 3 consecutive failed polls |
| ASIC overheat | 85 °C |
| VR overheat | 85 °C |
| Hashrate drop | < 0.5 TH/s |
| New block found | Always |

---

## Dependencies

| Package | Purpose |
|---|---|
| `requests` | API polling + Discord webhooks |
| `Pillow` | Vegvisir / Valknut image rendering |
| `pystray` | System tray icon (optional — app works without it) |
| `tkinter` | GUI framework (bundled with Python) |

---

## License

Personal / educational use. No warranty expressed or implied.  
*May your difficulty be low and your uptime eternal.*
