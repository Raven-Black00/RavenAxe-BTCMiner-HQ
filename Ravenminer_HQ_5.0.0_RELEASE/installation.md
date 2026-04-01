# RAVENMINER HQ — Installation
### ᚱᚨᚹᛖᚾ · The Keeper's Codex · v5.0.5

> *The longhouse does not run itself.*  
> *Read these runes before you light the forge.*  
> *Ignore them and the wolves will find you first.*

---

## ᛟ Requirements — What the Forge Demands

**Python 3.10 or higher** is required.  
Install all dependencies from the World Tree:

```bash
pip install -r requirements.txt
```

If `tkinter` is missing on Linux:

```bash
# Debian / Ubuntu
sudo apt install python3-tk

# Fedora / RHEL
sudo dnf install python3-tkinter

# Arch
sudo pacman -S tk
```

---

## ᚠ First Run — Carving the First Rune

Launch the longhouse from the project root:

```bash
python Ravenminer_HQ_5.0.5.py
```

On first invocation, a Settings scroll appears automatically.  
Fill the sacred fields or the ravens fly blind.  
Two config scrolls are conjured beside the script:

| File | Purpose |
|------|---------|
| `ravenminer_config.json` | Miner IP, refresh interval, rolling average window |
| `ravenminer_alerts.json` | Discord webhook URL, alert thresholds, toggles |

---

## ᚨ Configuration — The Settings Scroll

Open Settings from the tray icon right-click menu or the in-app menu bar.

| Rune | Field | Purpose |
|------|-------|---------|
| ᛗ | `minerip` | IP address of your NerdQaxe++ rig |
| ᚢ | `stratumUser` | Your miner's true name (burns gold on the ping row) |
| ᛞ | `discord_webhook` | The war-horn URL — from Discord channel → Integrations → Webhooks |
| ᛏ | `pingavgwindow` | Rolling ping window in seconds (default: 60) |
| ᚱ | `hrrefreshvar` | Hashrate graph refresh rate — floor is 0.10 seconds |
| ᚾ | `avg_window` | Rolling average window for current & core volt (1.0–10.0 s) |

Settings are cached in memory and written to JSON on save.  
**Do not edit the JSON files by hand** unless you speak the machine tongue.

---

## 🏆 Discord Milestones — The War-Horn

As of **v5.0.5**, the Discord alert system works as follows:

**🏆 NEW MILESTONE** fires at every 50M difficulty rung crossed during a session:
- 50M → alert
- 100M → alert
- 150M → alert
- 200M → alert (and so on — **no ceiling**)

**Large jumps are handled correctly.** If your difficulty leaps from 40M to 175M
in a single poll, the war-horn fires three times in order:  
`50M → 100M → 150M`. No rung is skipped or silently swallowed.

**⚡ NEW BEST DIFFICULTY alerts have been retired** (v5.0.5). They were too eager.  
Milestones speak when something worth celebrating has actually been crossed.

### Arming the War-Horn

1. Open your Discord server
2. Navigate to **Channel Settings → Integrations → Webhooks**
3. Create a new webhook and copy the URL
4. Paste it into the `discord_webhook` field in Settings
5. Save — the horn is armed

> *Odin does not whisper. But even Odin chooses his moments.*

---

## 🌊 Ping Colours — Reading the Tide

The rolling ping display speaks in colour:

| Colour | Threshold | Omen |
|--------|-----------|------|
| 🟢 GREEN | below 50 ms | Swift as Sleipnir — all is well |
| 🟠 ORANGE | below 120 ms | Bifrost at dusk — watch the horizon |
| 🔴 RED | 120 ms+ | Ragnarök approaches — check your network |

Ping is TCP-born, non-blocking, daemon-threaded.  
`ping_inflight` stands guard — threads do not pile like corpses.

---

## ᛒ The Tray Daemon — The Unseen Watcher

RavenMiner HQ lives in your system tray when minimised.  
Right-click the tray icon to:

- **Show** — summon the longhouse to the foreground
- **⚡ NEW DIFFICULTY** — fires as a pop-up when a new personal best is set
- **Quit** — extinguish the forge

> *The unseen watcher never sleeps.*  
> *Even when the window is gone, the wolves are still counted.*

---

## 📊 Gauge Reference

| Gauge | Source Field | Colour Thresholds |
|-------|-------------|-------------------|
| ASIC Temp | `temp` | GREEN < 60 °C · ORANGE < 75 °C · RED ≥ 75 °C |
| VR Temp | `vrTemp` | GREEN < 60 °C · ORANGE < 80 °C · RED ≥ 80 °C |
| Fan Speed | `fanspeed` | Displayed as % — no alert threshold by default |
| Input Current | `inputCurrent` | 10 s rolling avg (v4.0.4+) |
| Core Volt | `coreVoltageActual` | 10 s rolling avg (v4.0.4+) |
| Best Diff | `bestSessionDiff` | Tray popup + milestone webhook every 50M |
| Hashrate | `hashRate` | Alert if below user-set floor |
| Rejected % | derived | GREEN < 2% · ORANGE < 5% · RED ≥ 5% |

---

## ᛜ Troubleshooting — When Hail Falls

**The widget shows stale ping values**  
→ Fixed in v3.9.7+. `t2, f2` are captured before thread exit.  
  Ensure you are running the latest version.

**Settings panel crashes on empty alert fields**  
→ Fixed in v3.9.5+. `float(raw) or 0` guards the ValueError wolf.  
  Update and re-enter your settings.

**The miner IP is not found after settings change**  
→ The fallback rune `self.cfg.get("minerip", MINERIP)` holds the last known  
  address. Save settings again to re-anchor.

**Hashrate graph refresh is too fast / erratic**  
→ The floor is `0.10` seconds (v3.9.6+). Do not set below this.  
  The harvest will be crooked if you do.

**Discord webhook is silent**  
→ Verify the URL has no trailing spaces or newlines.  
→ Milestones fire every 50M — confirm your diff has crossed a rung.  
→ The old `⚡ NEW BEST DIFFICULTY` alert was removed in v5.0.5.

**Milestone fired again after a reconnect**  
→ Fixed in v5.0.4 (BUG#12). Resets only occur when uptime also drops  
  below 60 s. Transient API zeros no longer wipe the milestone ladder.

**A large jump skipped some milestones**  
→ Fixed in v5.0.4 (BUG#11). The while loop now marches all uncrossed  
  rungs in order. No milestone is swallowed by a large jump.

**Window is tiny or collapses on tray restore**  
→ Fixed in v4.0.1. Geometry is flushed and animation delayed 400 ms  
  before bars begin painting. Update to the latest version.

---

## ᛞ Packaging — For the Uninitiated

To forge a standalone `.exe` for those who do not speak Python:

```bash
pip install pyinstaller
pyinstaller --onefile --windowed --icon=assets/huginn.ico Ravenminer_HQ_5.0.5.py
```

Or use the included batch forge hammer:

```bash
RavenMiner_BUILD_5.0.5.bat
```

The compiled relic appears in `dist\`.  
Carry it to any Windows machine without Python installed.

---

## ᚷ File Structure — The Bones of the Longhouse

```
ravenminer-hq/
├── Ravenminer_HQ_5.0.5.py       ← The forge itself
├── RavenMiner_BUILD_5.0.5.bat   ← The hammer
├── ravenminer_config.json       ← The sacred scroll (auto-generated)
├── ravenminer_alerts.json       ← The war-horn scroll (auto-generated)
├── requirements.txt             ← The dependencies of Yggdrasil
├── README.md                    ← The longhouse overview
├── CHANGELOG.md                 ← Every wound healed in the codeforge
├── Release-Notes.md             ← The herald's crier
├── installation.md              ← This very codex
└── assets/
    ├── huginn.ico               ← Thought, watching from the tray
    └── vegvisir.png             ← The wayfinding sigil
```

---

## ᛟ Attribution

This software was forged by **Alan Klusacek** (`sonofodin@outlook.com`).  
Documentation for v5.0.5 was crafted with the aid of **Perplexity AI**,  
who read the runes and wrote them back truer.

---

```
      H       M
     / \     / \
    / U \   / U \
   / G   \ / N   \
  / I     V    I  \
  ______RAVENMINER HQ______
  ᚠᛖᚺᚢ  ᛏᛁᚹᚨᛉ  ᛟᛞᛁᚾᚾ
```

*May your difficulty be low.*  
*May your uptime be eternal.*  
*The ravens watch. The Allfather approves.*

**R A V E N M I N E R  H Q**  
`ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ — ᛏ ᛒ ᛗ — ᛜ ᛞ ᛟ`
