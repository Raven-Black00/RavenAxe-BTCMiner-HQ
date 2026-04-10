# ᚱᚨᚹᛖᚾᛗᛁᚾᛖᚱ ᚺᚴ

```
ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ ᚺ ᚾ ᛁ ᛃ ᛇ ᛈ ᛉ ᛊ ᛏ ᛒ ᛖ ᛗ ᛚ ᛜ ᛞ ᛟ
```

> *The ravens HUGINN and MUNINN carry the hashrate across the nine realms.*
> *Where they land — profit follows.*

---

## ᚠᛖᚺᚢ — What Is RavenMiner HQ?

**RavenMiner HQ** is a desktop mining monitor and alert daemon for
NerdQaxe++, forged in Python and sealed
with PyInstaller into a single `.exe` rune-stone.

It watches your miner, whispers when hashrate falls, screams to your phone
when blocks are found, and stands as a silent sentinel in your system tray —
like a raven perched on the World Tree.

**Current version: 5.4.9**

---

## ᚢᚱᚢᛉ — Requirements

| Rune | Dependency | Purpose |
|------|-----------|---------|
| ᚠ FEHU | Python 3.10+ | The serpent of Midgard |
| ᚨ ANSUZ | `requests` | Speaks to the pool API and ntfy.sh |
| ᚲ KENAZ | `Pillow` | Supersampled graph rendering + tray icon |
| ᚷ GEBO | `pystray` | Binds the tray spirit |
| ᛏ TIWAZ | PyInstaller | Forges the .exe |

Install all at once:

```bash
pip install -r requirements.txt
```

---

## ᚨᚾᛊᚢᛉ — Installation

**Clone the longhouse:**

```bash
git clone https://github.com/Raven-Black00/RavenAxe-BTCMiner-HQ.git
cd RavenAxe-BTCMiner-HQ
pip install -r requirements.txt
```

**Run from source:**

```bash
python Ravenminer_HQ_5_4_9.py
```

---

## ᚱᚨᛁᛞᛟ — Building the .exe

```bash
pip install pyinstaller
pyinstaller --onefile --windowed --icon=assets/huginn.ico Ravenminer_HQ_5_4_9.py
```

Or use **RavenForge** — the animated GUI build assistant included in this repo.

The finished `.exe` lands in `dist\`.

---

## ᚲᛖᚾᚨᛉ — Configuration

On first run, two rune-scrolls are conjured automatically beside the `.exe`:

| File | Purpose |
|------|---------|
| `ravenminer_config.json` | Miner IP, pool, refresh interval |
| `ravenminer_alerts.json` | Thresholds, ntfy topic URL |

Edit them in Settings or any text editor. The watcher reads them live —
no restart required.

---

## ᚷᛖᛒᛟ — Features

- ᛊ **Live hashrate monitoring** — polls the NerdQaxe API on your chosen interval
- ᛏ **Five-gauge instrument panel** — ASIC temp, VR temp, Voltage, Current, with analogue arcs
- ᚾ **Push alert system (ntfy.sh)** — native phone notifications, no Discord required
- ᛜ **System tray daemon** — lives in the tray, out of your way
- ᛞ **Colour-coded status** — GREEN / GOLD / RED / ORANGE at a glance
- ᚱ **TCP ping with rolling average** — live latency to your miner
- 💓 **ECG heart-rate ping graph** — three-pass glow waveform, colour-coded by latency band
- ᛟ **BTC price live** — CoinGecko feed, refreshed every 60 seconds
- ᚲ **Rejection % tracking** — share rejection colour-coded by severity
- 🐦‍⬛ **Huginn & Muninn** — animated raven pair, always watching
- ᚹ **Vegvisir watermark** — the wayfinding sigil, always present
- ᛟ **Zero cloud dependency** — everything runs local, ntfy is optional
- 📶 **WiFi RSSI + SSID display** — signal strength and network name live
- 💨 **Fan speed % display** — colour-coded fan load indicator
- 🔄 **Rolling average window** — configurable AVGWINDOW for current & voltage
- 🔵 **Best-Diff blue breathe** — animated pulse + red bounce on new personal best
- ᚠ **Flanking rune animation** — Elder Futhark cycles flank the Best-Diff counter
- 📜 **Source code viewer** — syntax-highlighted in-app reader
- ⚒ **RavenForge UI** — Viking font, animated Vegvisir compass, rune particles, pulsing gold title

---

## ⚡ ntfy.sh Push Notifications

RavenMiner HQ uses **ntfy.sh** for push alerts — free, open-source, no account required.

**30-second setup:**
1. Install the ntfy app on your phone
2. Paste `https://ntfy.sh/your-secret-topic` into Settings → NTFY.SH ALERTS
3. Click **▶  TEST NOTIFY  (ntfy.sh)**
4. Done — your phone receives alerts from anywhere on Earth

Self-hosting is supported: replace the URL with your local ntfy server address
and nothing leaves your network.

---

## ᚹᚢᚾᛃᛟ — Colour Palette

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

## ᛏᛁᚹᚨᛉ — Troubleshooting

**Python not found**
> Add Python to your PATH. Tick *"Add Python to PATH"* during install.

**Defender flags the .exe**
> Expected on first run. Allow it once — it will not ask again.

**pystray fails to import**
> Tray icon disabled. The rest of the forge continues. `pip install pystray`

**ntfy test passes but no phone notification**
> Confirm the ntfy app is subscribed to your exact topic name (case-sensitive).

**WiFi RSSI shows `---`**
> Your NerdQaxe firmware may not expose `wifiRSSI` — update firmware or ignore.

**Voltage / Current gauges show 0**
> Confirm `coreVoltageActual` and `currentA` are present in your miner's
> `/api/system/info` response. Only NerdQaxe++ firmware exposes these fields.

**Ping graph is flat / not rendering**
> Install Pillow: `pip install Pillow`. The graph also works without Pillow
> via the tkinter fallback renderer — check that ping history is accumulating
> (requires at least 2 successful TCP pings after launch).

---

## ᛒᛖᚱᚲᚨᚾᛟ — Project Structure

```
RavenAxe-BTCMiner-HQ/
├── Ravenminer_HQ_5_4_9.py   ← The great serpent
├── ravenforge_v2.py           ← The forge assistant
├── requirements.txt           ← The rune-dependency scroll
├── ravenminer_config.json     ← Auto-conjured on first run
├── ravenminer_alerts.json     ← Auto-conjured on first run
├── CHANGELOG.md               ← Every wound healed in the codeforge
├── Release-Notes.md           ← This release's chronicle
├── instructions.md            ← The Keeper's Codex
├── RavenForge_Instructions.md ← RavenForge usage guide
└── dist/                      ← The forged .exe lands here
```

---

## ᛗᚨᚾᚾᚨᛉ — Contributing

Pull requests are welcomed like gifts at the mead-hall.

1. Fork the repository
2. Branch from `main` — name it after a rune: `feature/dagaz-dark-mode`
3. Write your runes, test them
4. Open a pull request — describe what you forged and why

---

## ᛚᚨᚷᚢᛉ — License

MIT — free as the wind over Asgard.
Use it, fork it, forge it anew. Give credit where the mead flows.

---

## ᛞᚨᚷᚨᛉ — Version History

| Version | Rune | Notes |
|---------|------|-------|
| 5.4.9 | ᛈ PERTHO | ECG ping graph · three-pass glow · data dots · latency colour bands |
| 5.4.0 | ᚢ URUZ | RavenForge UI overhaul · Viking font · Vegvisir compass · frozen-exe fix |
| 5.2.10 | ᛟ OTHALA | Voltage + current gauges · WiFi · fan % · source viewer · avg window |
| 5.2.9 | ᛏ TIWAZ | Reboot slide-to-confirm · instant isonline=False |
| 5.2.8 | ᛒ BERKANO | Best-Diff blue breathe · red bounce · #00aaff label |
| 5.2.5 | ᚺ HAGALAZ | Flanking rune animation · CONNECTION LOST on startup |
| 5.2.2 | ᛃ JERA | lblstatus widget removed |
| 5.2.1 | ᚱ RAIDHO | Dead code purged · debug prints · credentials leak sealed |
| 5.2.0 | ᚨ ANSUZ | ntfy.sh replaces Discord · raven fix · 5 bugs slain |
| 4.0.0 | ᛞ DAGAZ | Milestone alerts · clickable email header |
| 3.9.9 | ᛟ OTHALA | Rolling ping · thread-safety hardening |
| 3.9.4 | ᛟ OTHALA | Foundation |

---

## ᛟᛞᛁᚾᚾ — Acknowledgements

- **ODIN** — for the wisdom of two watchful ravens
- **Thor** — whose hammer inspired the forge hammer
- **ntfy.sh** — for the war-horn that needs no Discord
- **PyInstaller** — for sealing the serpent into a single stone
- **Pillow / LANCZOS** — for the supersampled glow that makes graphs breathe
- **Alan Klusacek** — for carving the first rune

---

```
ᚠᛖᚺᚢ ᛏᛁᚹᚨᛉ ᛟᛞᛁᚾᚾ
  The forge burns eternal.
  R A V E N M I N E R  H Q   v 5 . 4 . 9
ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ — ᛏ ᛒ ᛗ — ᛜ ᛞ ᛟ
```
