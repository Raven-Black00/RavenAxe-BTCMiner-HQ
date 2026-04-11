# RAVENMINER HQ

> The ravens HUGINN and MUNINN carry the hashrate across the nine realms.  
> Where they land, profit follows.

RavenMiner HQ is a desktop mining monitor and alert daemon for NerdQaxe, forged in Python and sealed with PyInstaller into a single `.exe` rune-stone. It watches your miner, whispers when hashrate falls, screams to your phone when blocks are found, and stands as a silent sentinel in your system tray — like a raven perched on the World Tree.

**Current version: 5.5.1 — GEBO — The Horn of Odin**

---

## Requirements

| Rune | Dependency | Purpose |
|------|-----------|--------|
| FEHU | Python 3.10+ | The serpent of Midgard |
| ANSUZ | requests | Speaks to the pool API and ntfy.sh |
| KENAZ | Pillow | Supersampled graph rendering / tray icon |
| GEBO | pystray | Binds the tray spirit |
| TIWAZ | PyInstaller | Forges the `.exe` |

```bash
pip install -r requirements.txt
```

---

## Installation

```bash
git clone https://github.com/Raven-Black00/RavenAxe-BTCMiner-HQ.git
cd RavenAxe-BTCMiner-HQ
pip install -r requirements.txt
python RavenminerHQ552.py
```

---

## Building the .exe

```bash
pip install pyinstaller
pyinstaller --onefile --windowed --icon=assets/huginn.ico RavenminerHQ552.py
```

Or use **RavenForge** — the animated GUI build assistant included in this repo.

---

## Features

- Live hashrate monitoring
- Five-gauge instrument panel — ASIC temp, VR temp, Voltage, Current
- Push alert system — ntfy.sh phone notifications
- **Viking war-horn audio** — embedded PCM WAV, plays on startup and every block found
- System tray daemon
- ECG heart-rate ping graph — three-pass glow waveform
- BTC price — live CoinGecko feed
- Huginn & Muninn animated raven pair
- Vegvisir watermark
- WiFi RSSI / SSID, fan speed, source viewer, rolling averages, Best-Diff tracker
- RavenForge UI — Viking font, animated Vegvisir compass, rune particles

---

## Troubleshooting

| Symptom | Cure |
|---------|------|
| Python not found | Add Python to PATH during install |
| Defender flags .exe | Allow it once on first run |
| No startup/block horn | Windows only — `winsound` is stdlib, no install needed |
| pystray fails | `pip install pystray` |
| ntfy no phone buzz | Check topic name is case-sensitive match |
| Ping graph flat | `pip install Pillow`, need 2+ successful pings |

---

## Version History

| Version | Rune | Notes |
|---------|------|-------|
| 5.5.2 | SOWILO | Valknut & ravens full-blaze on share, hashrate graph label fixes |
| 5.5.1 | GEBO | Viking war-horn on startup + block-found audio, embedded PCM WAV |
| 5.4.9 | PERTHO | ECG ping graph, three-pass glow, latency colour bands |
| 5.4.0 | URUZ | RavenForge UI overhaul, Viking font, Vegvisir compass |
| 5.2.10 | OTHALA | Voltage/current gauges, WiFi, fan, source viewer |
| 5.2.9 | TIWAZ | Reboot slide-to-confirm |
| 5.2.0 | ANSUZ | ntfy.sh replaces Discord |
| 4.0.0 | DAGAZ | Milestone alerts |
| 3.9.4 | OTHALA | Foundation |

---

## License

MIT — free as the wind over Asgard.

```
R A V E N M I N E R   H Q   v 5 . 5 . 2
May your difficulty be low. May your uptime be eternal.
The ravens watch. The Allfather approves.
```
