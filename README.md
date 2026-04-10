# RAVENMINER HQ

> The ravens HUGINN and MUNINN carry the hashrate across the nine realms.  
> Where they land, profit follows.

RavenMiner HQ is a desktop mining monitor and alert daemon for NerdQaxe, forged in Python and sealed with PyInstaller into a single `.exe` rune-stone. It watches your miner, whispers when hashrate falls, screams to your phone when blocks are found, and stands as a silent sentinel in your system tray — like a raven perched on the World Tree.

**Current version: 5.5.1 — GEBO — The Horn of Odin**

---

## What Is RavenMiner HQ?

A live dashboard that polls your NerdQaxe miner API at your chosen interval and renders every metric in an Elder Futhark–themed window: temperature gauges, hashrate history, ping ECG, Best-Diff tracker, rune animations, and push alerts to your phone the moment something demands your attention.

---

## Requirements

| Rune | Dependency | Purpose |
|------|-----------|--------|
| FEHU | Python 3.10+ | The serpent of Midgard |
| ANSUZ | requests | Speaks to the pool API and ntfy.sh |
| KENAZ | Pillow | Supersampled graph rendering / tray icon |
| GEBO | pystray | Binds the tray spirit |
| TIWAZ | PyInstaller | Forges the `.exe` |

Install all at once:

```bash
pip install -r requirements.txt
```

---

## Installation

```bash
git clone https://github.com/Raven-Black00/RavenAxe-BTCMiner-HQ.git
cd RavenAxe-BTCMiner-HQ
pip install -r requirements.txt
python RavenminerHQ551.py
```

---

## Building the .exe

```bash
pip install pyinstaller
pyinstaller --onefile --windowed --icon=assets/huginn.ico RavenminerHQ551.py
```

Or use **RavenForge** — the animated GUI build assistant included in this repo.  
The finished `.exe` lands in `dist/`.

---

## Configuration

On first run, two rune-scrolls are conjured automatically beside the `.exe`:

| File | Purpose |
|------|--------|
| `ravenminer-config.json` | Miner IP, pool, refresh interval |
| `ravenminer-alerts.json` | Thresholds, ntfy topic URL |

Edit them in **Settings** or any text editor. The watcher reads them live — no restart required.

---

## Features

- Live hashrate monitoring — polls the NerdQaxe API on your chosen interval
- Five-gauge instrument panel — ASIC temp, VR temp, Voltage, Current with analogue arcs
- Push alert system — ntfy.sh native phone notifications, no Discord required
- **Viking war-horn audio** — embedded PCM WAV plays on startup and on every block found
- System tray daemon — lives in the tray, out of your way
- Colour-coded status — GREEN / GOLD / RED / ORANGE at a glance
- TCP ping with rolling average — live latency to your miner
- ECG heart-rate ping graph — three-pass glow waveform, colour-coded by latency band
- BTC price — live CoinGecko feed, refreshed every 60 seconds
- Rejection tracking — share rejection colour-coded by severity
- Huginn & Muninn animated raven pair — always watching
- Vegvisir watermark — the wayfinding sigil, always present
- Zero cloud dependency — everything runs local, ntfy is optional
- WiFi RSSI / SSID display — signal strength and network name live
- Fan speed display — colour-coded fan load indicator
- Rolling average window — configurable AVGWINDOW for current / voltage
- Best-Diff blue breathe — animated pulse, red bounce on new personal best
- Flanking rune animation — Elder Futhark cycles flank the Best-Diff counter
- Source code viewer — syntax-highlighted in-app reader
- RavenForge UI — Viking font, animated Vegvisir compass, rune particles, pulsing gold title

---

## ntfy.sh Push Notifications

RavenMiner HQ uses ntfy.sh for push alerts — free, open-source, no account required.

**30-second setup:**

1. Install the **ntfy** app on your phone
2. Paste `https://ntfy.sh/your-secret-topic` into **Settings → NTFY.SH ALERTS**
3. Click **TEST NOTIFY**
4. Done — your phone receives alerts from anywhere on Earth

Self-hosting is supported — replace the URL with your local ntfy server address and nothing leaves your network.

---

## Colour Palette

| Name | Hex | Rune Role |
|------|-----|-----------|
| GOLD BRIGHT | `#f0c040` | Headers, primary text |
| GOLD | `#c9a84c` | Labels, prompts |
| PURPLE GLOW | `#9d5fff` | Section banners |
| CYAN | `#00e5ff` | In-progress / ping low / VR gauge |
| CYAN PING | `#00ffcc` | Ping ECG graph — swift latency |
| GREEN | `#00ff88` | Success / good values / voltage gauge |
| BLUE | `#00aaff` | Best-Diff counter |
| RED | `#ff3030` | Failure / critical |
| ORANGE | `#ff7700` | Warning / elevated / current gauge |
| ORANGE PING | `#ffaa00` | Ping ECG graph — marginal latency |
| RED PING | `#ff3344` | Ping ECG graph — critical latency |

---

## Troubleshooting

| Symptom | Cure |
|---------|------|
| Python not found | Add Python to your PATH. Tick **Add Python to PATH** during install. |
| Defender flags the .exe | Expected on first run. Allow it once — it will not ask again. |
| pystray fails to import | Tray icon disabled. The rest of the forge continues. `pip install pystray` |
| ntfy test passes but no phone notification | Confirm the ntfy app is subscribed to your exact topic name (case-sensitive). |
| WiFi RSSI shows `---` | Your NerdQaxe firmware may not expose `wifiRSSI` — update firmware or ignore. |
| Voltage / Current gauges show 0 | Confirm `coreVoltageActual` and `currentA` are present in your miner's `api/system/info`. |
| Ping graph is flat | Install Pillow (`pip install Pillow`). Requires at least 2 successful TCP pings after launch. |
| No startup horn / block sound | Requires Windows. `winsound` is stdlib — no install needed. |

---

## Project Structure

```
RavenAxe-BTCMiner-HQ/
├── RavenminerHQ551.py          The great serpent
├── ravenforgev2.py             The forge assistant
├── requirements.txt            The rune-dependency scroll
├── ravenminer-config.json      Auto-conjured on first run
├── ravenminer-alerts.json      Auto-conjured on first run
├── CHANGELOG.md                Every wound healed in the codeforge
├── Release Notes.md            This release's chronicle
├── instructions.md             The Keeper's Codex
├── RavenForge_Instructions.md  RavenForge usage guide
└── assets/
    ├── huginn.ico              Thought, watching from the tray
    └── vegvisir.png            The wayfinding sigil
```

---

## Contributing

Pull requests are welcomed like gifts at the mead-hall.

1. Fork the repository
2. Branch from `main` — name it after a rune (`feature/dagaz-dark-mode`)
3. Write your runes, test them
4. Open a pull request — describe what you forged and why

---

## License

MIT — free as the wind over Asgard. Use it, fork it, forge it anew. Give credit where the mead flows.

---

## Version History

| Version | Rune | Notes |
|---------|------|-------|
| 5.5.1 | GEBO | Viking war-horn on startup + block-found audio, embedded PCM WAV |
| 5.4.9 | PERTHO | ECG ping graph, three-pass glow, data dots, latency colour bands |
| 5.4.0 | URUZ | RavenForge UI overhaul, Viking font, Vegvisir compass, frozen-exe fix |
| 5.2.10 | OTHALA | Voltage / current gauges, WiFi, fan, source viewer, avg window |
| 5.2.9 | TIWAZ | Reboot slide-to-confirm, instant `isOnline=False` |
| 5.2.8 | BERKANO | Best-Diff blue breathe, red bounce, `#00aaff` label |
| 5.2.5 | HAGALAZ | Flanking rune animation, CONNECTION LOST on startup |
| 5.2.2 | JERA | `lblstatus` widget removed |
| 5.2.1 | RAIDHO | Dead code purged, debug prints, credentials leak sealed |
| 5.2.0 | ANSUZ | ntfy.sh replaces Discord, raven fix, 5 bugs slain |
| 4.0.0 | DAGAZ | Milestone alerts, clickable email header |
| 3.9.9 | OTHALA | Rolling ping, thread-safety hardening |
| 3.9.4 | OTHALA | Foundation |

---

## Acknowledgements

- **Odin** — for the wisdom of two watchful ravens
- **Thor** — whose hammer inspired the forge hammer
- **ntfy.sh** — for the war-horn that needs no Discord
- **PyInstaller** — for sealing the serpent into a single stone
- **Pillow LANCZOS** — for the supersampled glow that makes graphs breathe
- **Alan Klusacek** — for carving the first rune

---

```
R A V E N M I N E R   H Q   v 5 . 5 . 1
May your difficulty be low. May your uptime be eternal.
The ravens watch. The Allfather approves.
```
