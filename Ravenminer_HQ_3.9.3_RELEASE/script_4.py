
# ══════════════════════════════════════════════════════
# README.md — full Norse/Slavic themed
# ══════════════════════════════════════════════════════
readme = r"""# ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚲ — RavenMiner HQ

```
  ██████╗  █████╗ ██╗   ██╗███████╗███╗   ██╗███╗   ███╗██╗███╗   ██╗███████╗██████╗
  ██╔══██╗██╔══██╗██║   ██║██╔════╝████╗  ██║████╗ ████║██║████╗  ██║██╔════╝██╔══██╗
  ██████╔╝███████║██║   ██║█████╗  ██╔██╗ ██║██╔████╔██║██║██╔██╗ ██║█████╗  ██████╔╝
  ██╔══██╗██╔══██║╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║╚██╔╝██║██║██║╚██╗██║██╔══╝  ██╔══██╗
  ██║  ██║██║  ██║ ╚████╔╝ ███████╗██║ ╚████║██║ ╚═╝ ██║██║██║ ╚████║███████╗██║  ██║
  ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
                              H  Q   —   v 3 . 9 . 3
```

> *Two ravens fly at the Allfather's shoulder — Huginn carries Thought, Muninn carries Memory.*
> *One watches your hashrate. One watches your temperature.*
> *Neither sleeps.*

---

## ᚦ What is RavenMiner HQ?

**RavenMiner HQ** is a real-time Bitcoin mining dashboard built for the
**AvalonMiner / RavenMiner** family of ASIC miners. It monitors your miner
over the local network API and presents all critical data in a dark, Norse-themed
Tkinter GUI — with runic motifs, Vegvisir watermarks, Valknut animations, and
gold-on-purple aesthetics drawn from the Elder Futhark and Slavic symbolism.

---

## ᚨ Features

### ᛏ Real-Time Monitoring
- **Hashrate** — live TH/s with animated electric-blue pulse glow
- **Hashrate History Graph** — 40×16 animated sub-bar chart; bars below 6.4 TH/s turn red
- **ASIC & VR Temperature** — gauge arcs with colour-coded needle (green/orange/red)
- **Power** — colour thresholds: green 0–119W · orange 120–129W · red 130W+
- **Input Current** — green 0–9.9A · orange 10–11.9A · red 12A+
- **Voltage** — red <12V · orange 11.99V · green 12–12.8V · orange 12.8–13.1V · red 13.1V+
- **Fan Speed & RPM** — colour-coded
- **WiFi RSSI** — signal strength with colour coding
- **Shares OK / BAD / Best Diff** — large font, bright display with rejection % in red
- **BTC Price** — live via CoinGecko API (updates every ~60s)
- **Pool & Uptime** — gold pulsing labels
- **Next Block Countdown** — animated progress bar

### ᚠ Alerts (Discord Webhooks)
- ASIC overheat alert
- VR overheat alert
- Low hashrate alert
- Block found notification
- Miner offline (3 consecutive failed polls)
- 60-second cooldown per alert type — no flooding

### ᚢ UI & Aesthetics
- **Vegvisir** watermark background (animated, centre panel)
- **Valknut** animated flash on each new accepted share
- **Huginn & Muninn** raven pair flanking the watermark
- **Block Found** full-screen flash with Norse rune overlay and audio beep
- **◉ LIVE / ◉ OFFLINE** pulsing indicator in bottom bar
- **Light / Dark** theme toggle
- **System tray** icon with show/hide/quit (pystray)
- **Source Code Viewer** — built-in syntax-highlighted code browser with live search
- **Hi-res 3D gear** settings button with golden glow ring on hover

### ⚙ Settings & Control
- Miner IP configuration (saved to JSON)
- Thermal limits, target temp, fan control, frequency, core voltage
- Discord webhook URL + alert thresholds
- Reboot slider guard (2-second hold to confirm)
- Adjustable refresh rate (0.5s – 60s)
- Adjustable graph refresh rate

---

## ᚱ Screenshot

```
┌──────────────────────────────────────────────────────────────────────┐
│  ᚱᚨᚡᛖᚾ  Huginn · Muninn · Thought · Memory         12:34:56  v3.9.3│
├──────────────────────────────────────────────────────────────────────┤
│  TEMP ᚦ    │      ᚺᚨᛊᚺᚱᚨᛏᛖ       │    ᚨᚠᚺ POWER HARDWARE         │
│  ASIC  65°C│                       │  POWER       115.0 W           │
│  VR    48°C│    ◉ LIVE             │  CURRENT       9.80 A          │
│  [gauge]   │   6.520  TH/s         │  VOLTAGE      12.24 V          │
│            │                       │  FREQUENCY   600 MHz           │
│  VR GAUGE  │  [hashrate bar graph] │  FAN SPEED      75%            │
│            │                       │  BTC PRICE  $87,420            │
│            │  SHARES OK │BAD│DIFF  │                                │
│            │    14,820  │  3 │ 45G  │        ⚙ (gear button)        │
└────────────┴───────────────────────┴────────────────────────────────┘
│ NEXT BLOCK ESTIMATE  [████████████░░░░░░░░]  7m 32s                  │
│ ◉ LIVE  TEST FLASH  </> CODE       Refresh: 0.25s   Graph: 5.0s     │
└──────────────────────────────────────────────────────────────────────┘
```

---

## ᛉ Quick Start

```bash
pip install -r requirements.txt
python Ravenminer_HQ_3.9.3.py
```

See **[INSTALL.md](INSTALL.md)** for full setup, `.exe` build instructions,
Discord alerts, and troubleshooting.

---

## ᛜ File Structure

```
RavenMiner_HQ_v3.9.3_RELEASE/
│
├── Ravenminer_HQ_3.9.3.py         ← Main program (run this)
├── RavenMiner_BUILD_3.9.3.bat     ← Build to .exe (Windows, Norse-themed)
├── requirements.txt               ← Python dependencies
├── README.md                      ← This file
├── INSTALL.md                     ← Full installation & config guide
├── CHANGELOG.md                   ← Full version history
│
├── src/
│   └── Ravenminer_HQ_3.9.3.py    ← Source copy
│
└── (auto-created at runtime)
    ├── ravenminer_config.json     ← Miner IP + theme preference
    └── ravenminer_alerts.json     ← Discord webhook + alert thresholds
```

---

## ᚲ Dependencies

| Package | Purpose |
|---------|---------|
| `requests` | Miner API polling + Discord webhooks + BTC price |
| `Pillow` | Vegvisir, Valknut, Raven images + gear bg removal |
| `pystray` | System tray icon (optional — gracefully disabled if absent) |
| `tkinter` | GUI framework (Python standard library) |

---

## ᚺ Miner Compatibility

Tested with:
- **AvalonMiner A14** series
- **RavenMiner** firmware

API endpoint: `http://<MINER_IP>/api/system/info`

---

## ᛞ Credits & Attribution

**Developed by:** Son Of Odin — sonofodinoutlook.com

**Settings gear icon:**
> 3D coin gear icon by pngtree.com
> [png image from pngtree.com](https://pngtree.com/freepng/3d-of-coins-gear-make-people-finish-work-concept_18202979.html)
> Used under the pngtree free license. All rights remain with the original creator.

**Norse/Slavic symbolism:**
- Vegvisir — Old Norse compass rune, guide through storms
- Valknut — Symbol of Odin, the knot of the slain
- Elder Futhark runes — ᚠᚢᚦᚨᚱᚲᚷᚹᚺᚾᛁᛃᛇᛈᛉᛊᛏᛒᛖᛗᛚᛜᛞᛟ
- Huginn & Muninn — Odin's ravens, Thought and Memory

---

## ᚾ License

MIT License — free to use, modify, and distribute.
Attribution appreciated but not required.

*May your difficulty be low and your uptime eternal.*
*ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚲ — The ravens watch.*
"""

with open(f"{base}/README.md", "w", encoding="utf-8") as f:
    f.write(readme)

print("✅ README.md written")
print(f"\nRelease folder contents:")
for root, dirs, files in os.walk(base):
    level = root.replace(base, '').count(os.sep)
    indent = '  ' * level
    print(f"{indent}{os.path.basename(root)}/")
    for file in files:
        size = os.path.getsize(os.path.join(root, file))
        print(f"{indent}  {file}  ({size:,} bytes)")
