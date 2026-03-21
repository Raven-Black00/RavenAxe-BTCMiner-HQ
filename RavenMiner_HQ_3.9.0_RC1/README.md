# RavenMiner HQ -- v3.9.0 RC1

> *"From the halls of Asgard, Huginn watches your hashrate. Muninn remembers your blocks."*

RavenMiner HQ is a full-featured, Norse-themed desktop dashboard for the AxeOS
Bitaxe ASIC miner family. Built in Python + Tkinter. No browser required.
Runs as a single .py or compiled .exe.

---

## Features

| Category            | Description                                               |
|---------------------|-----------------------------------------------------------|
| Live Monitoring     | Polls miner REST API every 0.5 s (configurable)           |
| Temperature Gauges  | ASIC & VR arc gauges, colour-zoned tick labels & readings |
| Hashrate Display    | Live TH/s + 1m / 10m / 1h averages, animated purple glow |
| History Chart       | Segmented colour-graded bar chart (last 40 data points)   |
| BTC Price           | Live CoinGecko price, refreshed every ~60 s               |
| Next Block Timer    | 10-minute Bitcoin block estimate with progress bar        |
| Discord Alerts      | Webhook alerts: overtemp, hash-drop, block-found, offline |
| Thread-Safe Polling | threading.Lock guards all data access between threads     |
| Settings Window     | 2-column layout: IP, pools, thermal, alerts, reboot       |
| System Tray         | Minimises to tray icon (requires pystray)                 |
| Norse Aesthetic     | Vegvisir + Valknut, Futhorc runic glyphs, animated runes  |

---

## Requirements

- Python 3.9+
- See requirements.txt

    pip install -r requirements.txt

| Package  | Purpose                                          |
|----------|--------------------------------------------------|
| requests | Miner API & CoinGecko HTTP calls                 |
| Pillow   | Embedded PNG asset rendering (Valknut, Vegvisir) |
| pystray  | System-tray icon support (optional)              |

---

## Quick Start

    git clone https://github.com/Raven-Black00/RavenMiner_HQ.git
    cd RavenMiner_HQ
    pip install -r requirements.txt
    python Ravenminer_HQ_3.9.0_RC1.py

Or double-click Launch_RavenMiner_HQ.bat on Windows.

---

## First Run

A setup dialog will ask for your miner IP address on first launch.
Saved to ravenminer_config.json next to the executable.
Default: 192.168.68.100

---

## Configuration Files

| File                     | Contents                                |
|--------------------------|-----------------------------------------|
| ravenminer_config.json   | Miner IP address                        |
| ravenminer_alerts.json   | Discord webhook URL & alert thresholds  |

Both files are created automatically on first run.

---

## Default Alert Thresholds

| Alert                        | Default       |
|------------------------------|---------------|
| ASIC over-temperature        | 85 C          |
| VR over-temperature          | 85 C          |
| Hash-rate drop               | < 0.5 TH/s    |
| Block found notification     | Enabled       |
| Miner offline (3 bad polls)  | Enabled       |

---

## Colour Key

| Colour  | Meaning                  |
|---------|--------------------------|
| Green   | Normal / safe            |
| Orange  | Elevated / warning       |
| Red     | Critical                 |
| Gold    | Labels & static UI       |
| Purple  | Hashrate & accents       |
| Cyan    | VR metrics & refresh     |

---

## Building an EXE

    pip install pyinstaller
    pyinstaller --onefile --windowed --name RavenMiner_HQ_3.9.0_RC1 Ravenminer_HQ_3.9.0_RC1.py

Or run build_exe.bat for a one-click build.

---

## License

MIT -- free to use, modify, and distribute.
Born from the forge of Odin. Share the fire.

---

## Acknowledgements

- AxeOS / Bitaxe  https://github.com/skot/ESP-Miner
- CoinGecko API   https://www.coingecko.com/en/api
- The Viking spirit of open-source hardware mining

---

*RavenMiner HQ -- Son of Odin -- github.com/Raven-Black00*
