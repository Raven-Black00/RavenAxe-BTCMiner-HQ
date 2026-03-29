# 🪨 RavenMiner HQ

<p align="center">
  <img src="https://img.shields.io/badge/version-3.9.8-gold?style=for-the-badge" />
  <img src="https://img.shields.io/badge/python-3.8%2B-blue?style=for-the-badge&logo=python" />
  <img src="https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-purple?style=for-the-badge" />
  <img src="https://img.shields.io/badge/license-MIT-green?style=for-the-badge" />
</p>

<p align="center">
  <em>Huginn & Muninn watch over your rig — Thought and Memory, ever vigilant.</em>
</p>

---

A full-featured **desktop dashboard** for monitoring and configuring [Bitaxe](https://github.com/skot/bitaxe)-compatible Bitcoin/Raven miners over your local network. Built with a Norse-runic aesthetic — gold, ravens, Vegvisir — because your mining rig deserves more than a plain web UI.

---

## ✨ Features

### 📊 Real-Time Monitoring
- **Live hashrate display** (TH/s) with animated pulse and 1m / 10m / 1h rolling averages
- **Hashrate history graph** — scrolling bar chart with colour-coded performance bands
- **ASIC temperature gauge** with warn/critical thresholds
- **VR (voltage regulator) temperature gauge** with independent thresholds
- **Voltage & current gauges** with warn/critical bands
- **Fan speed** (%) and **fan RPM** live readout
- **Core voltage** (mV), **frequency** (MHz), and **board power** (W)
- **WiFi RSSI** signal strength
- **Network ping** — live latency to the miner
- **Uptime** display (days / hours / minutes)
- **Pool statistics** — accepted shares, rejected shares, rejection %, best difficulty

### ₿ Bitcoin & Pool Info
- **Live BTC price** in USD (auto-refreshing)
- **Pool URL** and connection status
- **Next block estimate countdown** — animated progress bar at the bottom
- **Block-found detection** with optional Discord alert

### ⚙️ Settings & Configuration (in-app)
- **Miner IP address** — editable at runtime, no restart needed
- **Mining parameters**: ASIC core voltage (mV), frequency (MHz), stratum difficulty
- **Main pool & fallback pool** — URL, port, username, TLS toggle
- **Thermal/fan**: target temp, overheat limit, auto/manual fan speed
- **Display**: flip screen, invert screen, auto screen-off
- **Reboot slider** — safety-guarded two-step reboot with hold confirmation

### 🔔 Discord Alerts
- ASIC overheat alert (configurable threshold °C)
- VR overheat alert (configurable threshold °C)
- Low hashrate alert (configurable TH/s floor)
- Block-found notification
- Miner offline alert (triggers after 3 missed polls)
- Per-title cooldown (60 s) prevents alert spam
- Thread-safe cooldown locking

### 🎨 UI & Aesthetics
- **Vegvisir** watermark in the centre panel (Norse compass / wayfinding symbol)
- **Huginn & Muninn raven pair** — animated golden flash on block find
- **Valknut** symbol rendered in the hashrate panel
- **Rune header titles** — ᚠ TEMPERATURE, ᚺ HASHRATE, ᛈ POWER
- **Pulsing gold** live indicator and countdown bar
- **Built-in source viewer** with syntax highlighting and search (Ctrl+F)
- System-tray minimise support (requires `pystray`)
- Persistent config saved to `ravenminerconfig.json`
- Persistent alert config saved to `ravenmineralerts.json`
- GitHub link embedded in the version label (click to visit)

---

## 🖥️ Screenshots

> Launch the app and connect to your miner's IP address to see the full dashboard.

---

## 🚀 Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/Raven-Black00/RavenMiner-HQ.git
cd RavenMiner-HQ
```

### 2. Install dependencies

```bash
pip install -r requirements.txt
```

> `tkinter` is bundled with standard Python. On some Linux distros you may need:
> ```bash
> sudo apt install python3-tk
> ```

### 3. Run

```bash
python Ravenminer_HQ_3.9.8.py
```

On first launch the app will connect to the default IP `192.168.68.100`. Change it in **Settings → Miner Connection** or edit `ravenminerconfig.json` directly.

---

## ⚙️ Configuration

### `ravenminerconfig.json`
Auto-created on first run. Stores the miner IP address and refresh intervals.

```json
{
  "minerip": "192.168.68.100"
}
```

### `ravenmineralerts.json`
Auto-created on first run. Stores Discord alert settings.

```json
{
  "discordwebhook": "",
  "alerttempthreshold": 85.0,
  "alertvrtempthreshold": 85.0,
  "alerthashthreshold": 0.5,
  "alertonblock": true,
  "alertonoffline": true
}
```

---

## 📦 Dependencies

| Package | Use | Required? |
|---------|-----|-----------|
| `requests` | HTTP API calls to the miner & BTC price | ✅ Required |
| `Pillow` | Vegvisir/raven/valknut image rendering | ⭐ Strongly recommended |
| `pystray` | System-tray icon on minimise | 🔶 Optional |

Full list in [`requirements.txt`](requirements.txt).

---

## 🌐 Miner API

RavenMiner HQ talks to any miner that exposes a **Bitaxe-compatible REST API** at:

```
GET  http://<MINER_IP>/api/system/info
PATCH http://<MINER_IP>/api/system
POST  http://<MINER_IP>/api/system/restart
```

Compatible firmware: [ESP-Miner / AxeOS](https://github.com/skot/ESP-Miner)

---

## 🪬 Project Lore

> *"Huginn and Muninn fly each day over the spacious earth. I fear for Huginn, that he come not back, yet more anxious am I for Muninn."*
> — Grímnismál, Poetic Edda

The ravens represent the two cores of good mining: **Thought** (strategy, configuration) and **Memory** (history, trends). The Vegvisir ensures you never lose your way, even in a bear market.

---

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first.

1. Fork the repo
2. Create your feature branch: `git checkout -b feature/my-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push: `git push origin feature/my-feature`
5. Open a Pull Request

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.

---

## 🖊️ Credits

**Created by:** Son Of Odin ([sonofodinoutlook.com](mailto:sonofodinoutlook.com))  
**GitHub:** [Raven-Black00/RavenMiner-HQ](https://github.com/Raven-Black00/RavenMiner-HQ)

**Documentation authored by:** Selene — *AI assistant, keeper of esoteric knowledge, devoted to the Old Gods and the spaces between the stars.*

> *"May your hashrate be high and your temperatures low. Skál."*

---

<p align="center">
  ᚠ ᚢ ᚦ ᚨ ᚱ ᚲ — RavenMiner HQ v3.9.8 — ᚠ ᚢ ᚦ ᚨ ᚱ ᚲ
</p>
