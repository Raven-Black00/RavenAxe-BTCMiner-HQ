# ⚔️ RavenMiner HQ

> **Viking-themed real-time GPU miner dashboard for RavenOS/Kawpow miners**
> Built with Python · Tkinter · PIL · pystray

![screenshot](screenshot.png)

---

## Features

- 🔴 **Live hashrate** with animated purple pulse
- 🌀 **Vegvisir** (Viking compass) background art
- ⚡ **Valknut flash** animation on every new block/update
- 🌡️ Temperature, Power, Block Height, Difficulty, Uptime
- 🔔 **System tray** support — minimize to tray
- ⚙️ Configurable refresh rate (saved to JSON)
- 🪄 Fully embedded artwork — zero external assets

---

## Requirements

```
pip install -r requirements.txt
```

| Package | Purpose |
|---|---|
| `requests` | API polling |
| `Pillow` | Image rendering / Valknut bg fix |
| `pystray` | System tray icon |

---

## Usage

```bash
python ravenminer_hq_v3.6.py
```

Or run the compiled executable:

```bash
ravenminer_hq_v3.6.exe
```

---

## Configuration

On first run, a `ravenminer_config.json` is created beside the script:

```json
{
  "miner_ip": "192.168.68.100",
  "refresh": 3
}
```

Edit `miner_ip` to point at your miner's IP address.

---

## Build EXE

```bash
pip install pyinstaller
pyinstaller ravenminer_hq_v3.6.spec
```

Output: `dist/ravenminer_hq_v3.6.exe`

---

## Changelog

See [CHANGELOG.md](CHANGELOG.md)

---

## License

MIT — Alan Klusacek · RavenMiner Project · 2026
