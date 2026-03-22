# ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᛟᛃ  —  RavenMiner HQ

```
  ██████╗  █████╗ ██╗   ██╗███████╗███╗   ██╗███╗   ███╗██╗███╗   ██╗███████╗██████╗
  ██╔══██╗██╔══██╗██║   ██║██╔════╝████╗  ██║████╗ ████║██║████╗  ██║██╔════╝██╔══██╗
  ██████╔╝███████║██║   ██║█████╗  ██╔██╗ ██║██╔████╔██║██║██╔██╗ ██║█████╗  ██████╔╝
  ██╔══██╗██╔══██║╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║╚██╔╝██║██║██║╚██╗██║██╔══╝  ██╔══██╗
  ██║  ██║██║  ██║ ╚████╔╝ ███████╗██║ ╚████║██║ ╚═╝ ██║██║██║ ╚████║███████╗██║  ██║
  ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
                           ᚺ ᛟ ᛃ   —   H Q   D A S H B O A R D
                                  Version 3.9.0 RC2
```

> *"ᚠᚢᚱᚦᚢᛗᚱ ᚠᛖᛚᛚ — ᚠᚢᚱᚦᚢᛗᚱ ᚱᛁᛊᛖᛊ."*
> *The tree falls — the tree rises.*  — Norse Proverb

---

## ᚺᚡᚨᛏ ᛁᛊ ᛏᚺᛁᛊ — What Is This

**RavenMiner HQ** is a real-time desktop monitoring dashboard for
**BitAxe / AxeOS ASIC miners**, built in Python with Tkinter.
It polls your miner's local HTTP API every 500ms (configurable) and
renders live stats, animated gauges, hashrate history, and sends
**Discord webhook alerts** when things go wrong — all wrapped in a
deep-space Norse aesthetic with procedural Vegvisir and Valknut
animations.

---

## ᚠᛖᚨᛏᚢᚱᛖᛊ — Features

| ᚱᚢᚾᛖ | Category | Details |
|-------|----------|---------|
| ᚦ | Temperatures | ASIC + VR gauges with colour-coded needles (green/amber/red) |
| ᚺ | Hashrate | Live TH/s display + 1m / 10m / 1h averages + bar chart history |
| ᚠ | Power | Watts, input current (A), voltage (V), frequency (MHz), core voltage (mV) |
| ᛊ | Shares | Accepted / Rejected counters + best session difficulty |
| ᛒ | Blocks | Found block counter + flash animation + Discord alert |
| ᛞ | Discord | Webhooks for overheat, VR overheat, low hashrate, block found, offline |
| ᛁ | BTC Price | Live CoinGecko price ticker, refreshed every ~60s |
| ᚡ | Vegvisir | Procedurally drawn animated Norse compass in the centre panel |
| ᚲ | Valknut | 16-frame alpha-fade animation triggered on shares and blocks |
| ᛏ | System Tray | Minimise to tray with pystray (optional dependency) |
| ᚷ | Settings | Full in-app settings window with live PATCH to miner config |

---

## ᛊᚲᚱᛖᛖᚾᛊᚺᛟᛏ — Layout

```
┌─────────────────┬──────────────────────┬─────────────────┐
│  ᛏᛖᛗᛈᛖᚱᚨᛏᚢᚱᛖᛊ  │   ᚺᚨᛊᚺᚱᚨᛏᛖ           │  ᛈᛟᚹᛖᚱ & HW      │
│                 │                      │                 │
│  ASIC TEMP      │  ◉ LIVE              │  POWER          │
│  VR TEMP        │  ██.███ TH/s         │  INPUT CURR     │
│                 │                      │  VOLTAGE        │
│  [ASIC GAUGE]   │  [VEGVISIR]          │  FREQUENCY      │
│  [VR GAUGE]     │  [VALKNUT]           │  CORE VOLT      │
│                 │                      │  FAN SPEED      │
│  OVERHEAT LIM   │  1m / 10m / 1h AVG   │  FAN RPM        │
│  TARGET TEMP    │  [BAR CHART]         │                 │
│  REFRESH        │  SHARES OK/BAD       │  ᚠ BTC PRICE ᚠ  │
│                 │  POOL  |  UPTIME     │  $XX,XXX        │
│                 │  [NEXT BLOCK BAR]    │  WiFi RSSI      │
│                 │  BLOCKS FOUND        │  [⚙ SETTINGS]   │
└─────────────────┴──────────────────────┴─────────────────┘
```

---

## ᚱᛖᛔᚢᛁᚱᛖᛗᛖᚾᛏᛊ — Requirements

- Python **3.9+**
- See `requirements.txt` for full dependency list

**Quick install:**
```bash
pip install -r requirements.txt
```

---

## ᚱᚢᚾᚾᛁᚾᚷ — Running

**From source:**
```bash
python src/Ravenminer_HQ_3.9.0_RC2.py
```

**As compiled .exe** (Windows):
```
Double-click build_tools/BUILD_RC2.bat
Output will appear in dist/
```

On first launch a setup dialog will prompt for your miner's local IP address.
This is saved to `ravenminer_config.json` next to the executable.

---

## ᚲᛟᚾᚠᛁᚷ ᚠᛁᛚᛖᛊ — Config Files

| File | Purpose |
|------|---------|
| `ravenminer_config.json` | Miner IP address |
| `ravenminer_alerts.json` | Discord webhook URL + all alert thresholds |

Both files are auto-created on first run and live next to the `.exe` / script.

---

## ᛞᛁᛊᚲᛟᚱᛞ ᚨᛚᛖᚱᛏᛊ — Discord Alerts

Configure your webhook URL in the **Settings → Alerts** tab.

| Alert | Trigger |
|-------|---------|
| 🔥 MINER OVERHEAT | ASIC temp ≥ threshold (default 85°C) |
| 🟠 VR OVERHEAT | VR temp ≥ threshold (default 85°C) |
| ⚠️ LOW HASHRATE | Hashrate drops below threshold (default 0.5 TH/s) |
| ⛏️ BLOCK FOUND | New block detected |
| ❌ REJECTED SPIKE | 5+ shares rejected in one poll cycle |
| 🔴 MINER OFFLINE | 3 consecutive failed API polls |

---

## ᚠᛟᛚᛞᛖᚱ ᛊᛏᚱᚢᚲᛏᚢᚱᛖ — Folder Structure

```
RavenMiner_HQ_RC2/
├── src/
│   └── Ravenminer_HQ_3.9.0_RC2.py   ← Main application source
├── dist/                              ← PyInstaller output (.exe lands here)
├── build_tools/
│   └── BUILD_RC2.bat                 ← Norse-themed build script
├── docs/
│   ├── CHANGELOG.txt
│   ├── README.md
│   └── INSTRUCTIONS.txt
└── requirements.txt
```

---

## ᛚᛁᚲᛖᚾᛊᛖ — License

Open source. Use freely. Fork with honour.
Credit the rune-smith: **Alan Klusacek**

---

*ᚠᛖᛟ ᛏᛁᚱ ᛟᛞᛁᚾᚾ — Hail to Odin*
