# RavenMiner HQ v5.5.1 — Instructions

This guide covers installation, configuration, building the `.exe`, and troubleshooting for RavenMiner HQ v5.5.1 GEBO.

---

## Quick Start

1. Install Python 3.10 or later (add to PATH during install)
2. Clone or download this repo
3. `pip install -r requirements.txt`
4. `python RavenminerHQ551.py`

---

## Configuration

All settings are available via the **Settings** panel inside the app:

| Setting | Description |
|---------|-------------|
| MINER IP | IP address of your NerdQaxe / NerdAxe miner |
| POOL USER | Your mining pool username (used for block detection) |
| NTFY TOPIC | Your ntfy.sh topic for push alerts |
| AVGWINDOW | Number of data points for rolling hashrate average |
| ALERT THRESHOLD | Hashrate % drop that triggers a phone alert |

Settings are saved to `ravenminer_settings.json` in the same folder.

---

## Startup & Block-Found Horn

On Windows, a Viking war-horn plays:

1. **At startup** — the moment the longhouse opens
2. **Every time a block is found** — alongside the visual block flash

The WAV is embedded inside the script — no external file needed.  
On Linux or macOS the horn is a silent no-op. `winsound` is Windows stdlib — no install required.

---

## File Structure

```
RavenAxe-BTCMiner-HQ/
├── RavenminerHQ551.py          ← Main application (run this)
├── RavenForge.exe              ← GUI .exe builder tool
├── README.md
├── CHANGELOG.md
├── PATCHES.md                  ← All patches applied for v5.5.1
├── Release Notes.md
├── instructions.md
├── RavenForge_Instructions.md
└── requirements.txt
```

---

## Building the .exe (Manual)

```bash
pip install pyinstaller
pyinstaller --onefile --windowed RavenminerHQ551.py
```

The `.exe` will appear in `dist/RavenminerHQ551.exe`.

---

## Building with RavenForge

Double-click `RavenForge.exe` (or `python RavenForge.py`).  
RavenForge is the animated Viking-themed GUI build assistant:

1. Select your Python script (`RavenminerHQ551.py`)
2. Choose an icon (optional)
3. Click **FORGE**
4. Watch the Vegvisir compass spin while PyInstaller works
5. Find the `.exe` in the `dist/` folder

See `RavenForge_Instructions.md` for full details.

---

## Troubleshooting

| Symptom | Cure |
|---------|------|
| App won’t start | `python --version` — must be 3.10+ |
| `ModuleNotFoundError` | `pip install -r requirements.txt` |
| Defender quarantines .exe | Allow it once — false positive |
| No startup/block horn | Windows only; `winsound` is stdlib |
| No phone alerts | Check NTFY TOPIC matches your ntfy.sh subscription (case-sensitive) |
| Ping graph flat | Need Pillow installed + 2+ successful pings |
| Gauges show 0 | Check MINER IP is reachable from your PC |
| tray icon missing | `pip install pystray` |

---

## Phone Alerts (ntfy.sh)

1. Install the ntfy app on your phone
2. Subscribe to a topic (e.g. `ravenminer-alan`)
3. Enter the same topic in the app’s Settings → NTFY TOPIC
4. Alerts fire when hashrate drops below threshold or a block is found

No account needed. ntfy.sh is free for personal use.

---

## Updating

```bash
git pull origin main
python RavenminerHQ551.py
```

---

```
R A V E N M I N E R   H Q   v 5 . 5 . 1
May your difficulty be low. May your uptime be eternal.
The ravens watch. The Allfather approves.
```
