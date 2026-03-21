# ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚿ — RavenMiner HQ

> A dark Norse-themed desktop dashboard for monitoring and configuring your **Bitaxe** / **AxeOS** Bitcoin miner in real time.

![Python](https://img.shields.io/badge/Python-3.10%2B-blue?logo=python)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey?logo=windows)
![License](https://img.shields.io/badge/License-MIT-green)

---

## ✨ Features

| Category | Details |
|---|---|
| 📡 **Live Dashboard** | Real-time hashrate, temperature, power, fan, Wi-Fi RSSI, uptime |
| 🟢 **Live Pulse** | LIVE indicator pulses bright green when connected to miner |
| ⚡ **Hashrate Graph** | Segmented bar chart with wave-idle animation |
| 🌡️ **Dual Gauges** | ASIC temp + VR temp arc gauges with colour thresholds |
| ⚙️ **Full Settings** | Edit all miner config (pool, voltage, frequency, fan, thermal) |
| 🌐 **IP Management** | Change miner IP at startup or live in Settings — saved to config file |
| 🔄 **Safe Reboot** | Slider + 2-second hold confirmation to reboot the miner |
| ☀ / ☾ **Theme Toggle** | Switch between dark and light themes |
| 🔔 **System Tray** | Minimises to system tray with restore / quit |
| 💎 **Block Flash** | Full-screen flash animation on new block found |
| 🔺 **Valknut Flash** | Valknut icon animates on accepted shares |
| ᚱ **Runic UI** | Animated pulsing runic title and Norse iconography throughout |

---

## 🖥️ Screenshots

> *(Add screenshots here)*

---

## 🚀 Quick Start

### Option A — Run from source

```bash
git clone https://github.com/YOUR_USERNAME/ravenminer-hq.git
cd ravenminer-hq
pip install -r requirements.txt
python ravenminer_hq_settings.py
```

### Option B — Download the .exe

Download the latest `RavenMinerHQ.exe` from [Releases](../../releases) and run it directly.  
No Python installation required.

---

## ⚙️ First Run

On first launch a setup dialog will appear asking for your **Miner IP Address** (e.g. `192.168.68.100`).  
This is saved to `ravenminer_config.json` next to the `.exe` and loaded automatically on every subsequent launch.

You can change the IP at any time via **Settings → MINER CONNECTION → SAVE IP & RECONNECT**.

---

## 🔧 Building the .exe yourself

### Prerequisites
- Python 3.10+
- Windows 10 / 11

### One-click build
```bat
build.bat
```
Output: `dist\RavenMinerHQ.exe`

### Manual build
```bash
pip install -r requirements.txt
pyinstaller build.spec --clean --noconfirm
```

> **Tip:** Place an `icon.ico` file in the project root and update `icon=None` → `icon='icon.ico'` in `build.spec` to embed a custom icon.

---

## 📡 Miner Compatibility

Tested with **AxeOS** firmware on:

| Device | Notes |
|---|---|
| Bitaxe Ultra | BM1366 |
| Bitaxe Gamma | BM1370 |
| Bitaxe Supra | BM1368 |

Any miner running the **AxeOS** REST API (`/api/system/info`, `/api/system/config`) should work.

---

## 📁 Project Structure

```
ravenminer-hq/
├── ravenminer_hq_settings.py   # Main application
├── requirements.txt             # Python dependencies
├── build.spec                   # PyInstaller build spec
├── build.bat                    # One-click Windows build script
├── ravenminer_config.json       # Auto-created on first run (miner IP)
└── README.md
```

---

## 📦 Dependencies

| Package | Purpose |
|---|---|
| `requests` | HTTP polling of miner REST API |
| `Pillow` | Image processing for gauges, watermarks, tray icon |
| `pystray` | Windows system tray integration |
| `tkinter` | GUI framework (bundled with Python) |
| `pyinstaller` | Build tool for standalone .exe *(dev only)* |

---

## 🛠️ Settings Reference

| Section | Fields |
|---|---|
| **Miner Connection** | IP Address (saved locally, not sent to miner) |
| **Mining** | Hostname, ASIC frequency, core voltage |
| **Main Pool** | URL, port, user, password, TLS, difficulty |
| **Fallback Pool** | URL, port, user, password, TLS |
| **Thermal & Fan** | Target temp, overheat temp, fan speed, auto-fan |
| **Display** | Flip screen, invert screen, auto screen-off |

---

## 📜 License

MIT — see [LICENSE](LICENSE)

---

*Huginn & Muninn  |  Thought & Memory*
