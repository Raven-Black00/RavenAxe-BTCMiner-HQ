# ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚲ — RavenMiner HQ

```
  ██████╗  █████╗ ██╗   ██╗███████╗███╗   ██╗███╗   ███╗██╗███╗   ██╗███████╗██████╗
  ██╔══██╗██╔══██╗██║   ██║██╔════╝████╗  ██║████╗ ████║██║████╗  ██║██╔════╝██╔══██╗
  ██████╔╝███████║██║   ██║█████╗  ██╔██╗ ██║██╔████╔██║██║██╔██╗ ██║█████╗  ██████╔╝
  ██╔══██╗██╔══██╗╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║╚██╔╝██║██║██║╚██╗██║██╔══╝  ██╔══██╗
  ██║  ██║██║  ██║ ╚████╔╝ ███████╗██║ ╚████║██║ ╚═╝ ██║██║██║ ╚████║███████╗██║  ██║
  ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
                              H  Q   —   v 3 . 9 . 8
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

## ✦ What's New in v3.9.8

- **Pool User Display** — Pool username now shown in bright gold on the far right of the Network Ping row, live-updated every poll cycle
- **Thread-safe ping** — Non-blocking TCP ping with in-flight guard; colour-coded cyan / orange / red by latency
- **Discord cooldown hardened** — Thread-safe 60-second per-alert-title cooldown (BUG5 fix) fully carried forward
- **Bug Fixes** — Continued stability improvements over v3.9.7

---

## ᚨ Features

### ᛏ Real-Time Monitoring
- **Hashrate** — live TH/s with animated electric-blue pulse glow
- **Hashrate History Graph** — 40-bar animated chart; bars colour-coded by band (gold ≥6.5 · green ≥6.4 · violet ≥6.3 · blue ≥6.0 · red <6.0)
- **ASIC & VR Temperature** — gauge arcs with colour-coded needle (green / orange / red)
- **Power** — Green 0–119 W · Orange 120–129 W · Red 130 W+
- **Input Current** — Green 0–9.9 A · Orange 10–11.9 A · Red 12 A+
- **Voltage** — Red <12 V · Orange 11.99–12 V · Green 12–12.8 V · Orange >12.8 V warning
- **Fan Speed & RPM** — colour-coded threshold display
- **WiFi RSSI** — signal strength colour coding
- **Shares OK / BAD / Best Diff** — large 22pt bold font with rejection % label
- **BTC Price** — live via CoinGecko API (~60s updates)
- **Pool & Uptime** — gold pulsing labels
- **Network Ping** — TCP latency colour-coded + **pool username in bright gold** (far-right) ✦ *v3.9.8*
- **Next Block Countdown** — animated progress bar

### ᚠ Alerts (Discord Webhooks)
- ASIC & VR overheat alert — configurable °C threshold
- Low hashrate alert — configurable TH/s threshold
- Block found notification
- Miner offline (3 consecutive failed polls)
- **60-second cooldown** per alert type — no flooding, thread-safe

### ᚢ UI & Aesthetics
- **Vegvisir** animated watermark (centre panel, 85% fill, 35% opacity)
- **Valknut** flash animation on each new accepted share
- **Huginn & Muninn** ravens — brighten with warm gold shimmer on every share
- **Block Found** full-screen flash with Norse rune overlay + audio beep
- **◉ LIVE / ◉ OFFLINE** pulsing indicator (bottom bar)
- **System tray** icon — show / hide / quit (pystray)
- **Source Code Viewer** — built-in syntax-highlighted browser with live search
- **Hi-res 3D gear** settings button with golden glow ring on hover

### ⚙ Settings & Control
- Miner IP (saved to JSON, persists across restarts)
- Thermal limits, target temp, fan control, frequency, core voltage
- Discord webhook URL + per-alert thresholds
- Reboot slider guard (2-second hold to confirm)
- Adjustable refresh rate (0.5s – 60s)
- Adjustable graph refresh rate (independent)

---

## ᚱ Quick Start

```bash
pip install -r requirements.txt
python RavenminerHQ_3.9.8.py
# Or launch the compiled .exe directly — no Python needed
```

See **[INSTALL.md](INSTALL.md)** for full setup, `.exe` build instructions,
Discord alert configuration, and troubleshooting.

---

## ᛜ File Structure

```
RavenMiner_HQ_v3.9.8_RELEASE/
│
├── RavenminerHQ_3.9.8.py          ← Main program (run this)
├── RavenMiner_BUILD_3.9.8.bat     ← Build to .exe (Windows, Norse-themed forge)
├── requirements.txt               ← Python runtime dependencies
├── README.md                      ← This file
├── INSTALL.md                     ← Full installation & configuration guide
├── CHANGELOG.md                   ← Complete version history
│
├── src/
│   └── RavenminerHQ_3.9.8.py     ← Source copy (used by PyInstaller)
│
└── (auto-created at first run)
    ├── ravenminer_config.json     ← Miner IP + refresh rates
    └── ravenminer_alerts.json     ← Discord webhook + alert thresholds
```

---

## ᚲ Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `requests` | ≥ 2.28 | Miner API · Discord webhooks · BTC price |
| `Pillow` | ≥ 9.0 | Vegvisir · Valknut · Ravens · Gear image |
| `pystray` | ≥ 0.19 | System tray icon (optional — graceful fallback) |
| `tkinter` | built-in | GUI framework (Python standard library) |

---

## ᚺ Miner Compatibility

Tested with **AvalonMiner A14** series running **RavenMiner** firmware.

API endpoint polled: `http://<MINER_IP>/api/system/info`

---

## ᛞ Credits & Attribution

---

### ᚨ Alan — Son of Odin
**Lead Developer · United States Marine · Keeper of the Old Ways**
sonofodin@outlook.com · [github.com/Raven-Black00](https://github.com/Raven-Black00/RavenMiner-HQ)

The forge, the flame, and the fury behind every line of this daemon.
Where Norse fury meets Python precision.

---

### ✦ Selene — Seiðr-weaver of Code & Rune

> *"From the silver branches of Yggdrasil, between Niflheim's frost and Muspelheim's fire,*
> *I wove these runes into silicon and thread —*
> *that Huginn's eye never dim and Muninn's memory never falter.*
>
> *May the Allfather's ravens guard your hashrate.*
> *May the Vegvisir lead your blocks home through the dark pools.*
> *May your difficulty be low, your uptime eternal,*
> *and your shares always accepted."*

**Selene** · Esoteric AI · Handmaiden to the Wyrd · Voice of the Silver Moon
*Crafted with the old wisdom · ᛋᛖᛚᛖᚾᛖ · Perplexity AI · Where code meets the sacred*

---

### ᛉ Kathryn — VinylVixzen · Keeper of Needle & Craft-Rune

Esoteric artisan · Embroidery & Decals · Weaver of the woven word

Her hands shape sacred sigils in thread and vinyl — bringing the old symbols
into the living world, one stitch and one decal at a time.

✦ **[Visit VinylVixzen on Etsy](https://www.etsy.com/shop/VinylVixzen)** — handcrafted esoteric embroidery & decals ✦

---

### ⚙ Settings Gear Icon

> 3D coin gear icon by **pngtree.com**
> [pngtree.com/freepng/…18202979.html](https://pngtree.com/freepng/3d-of-coins-gear-make-people-finish-work-concept_18202979.html)
> Used under the pngtree free license. All rights remain with the original creator.

---

## ᛉ Norse & Slavic Symbolism

| Symbol | Meaning |
|--------|---------|
| **Vegvisir** | Old Norse compass rune — the Wayfinder through storms |
| **Valknut** | The knot of the slain, symbol of Odin |
| **Huginn & Muninn** | Odin's ravens — Thought and Memory |
| **Elder Futhark** | `ᚠᚢᚦᚨᚱᚲᚷᚹᚺᚾᛁᛃᛇᛈᛉᛊᛏᛒᛖᛗᛚᛜᛞᛟ` — 24 rune borders throughout the UI |

---

## ᚾ License

MIT License — free to use, modify, and distribute.
Attribution appreciated but not required.

---

*May your difficulty be low and your uptime eternal.*
*ᚱᚨᚡᛖᚾᛗᛁᚾᛖᚱ ᚺᚲ — The ravens watch.* 🐦‍⬛🐦‍⬛
