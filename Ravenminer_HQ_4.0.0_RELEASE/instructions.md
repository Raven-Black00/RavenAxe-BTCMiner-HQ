# RAVENMINER HQ — Instructions
### ᚱᚨᚹᛖᚾ · The Keeper's Codex

> *The longhouse does not run itself.*
> *Read these runes before you light the forge.*

---

## ᛟ Requirements — What the Forge Demands

Before the ravens fly, the forge must be fed.

**Python 3.10 or higher** is required.
Install all dependencies from the world tree:

```bash
pip install -r requirements.txt
```

If `tkinter` is missing on Linux, summon it thus:

```bash
# Debian / Ubuntu
sudo apt install python3-tk

# Fedora / RHEL
sudo dnf install python3-tkinter
```

---

## ᚠ First Run — Carving the First Rune

Launch the longhouse from the project root:

```bash
python ravenminer_hq.py
```

On first invocation, a settings scroll will appear.
Fill the sacred fields or the ravens fly blind.

---

## ᚨ Configuration — The Settings Scroll

Open the settings panel from the tray icon or the menu.
The following runes must be carved:

| Rune | Field | Purpose |
|---|---|---|
| ᛗ | `minerip` | IP address of your mining rig |
| ᚢ | `stratumUser` | Your miner's true name (burns gold on the ping row) |
| ᛞ | `discordwebhook` | The war-horn URL — paste from Discord channel settings |
| ᛏ | `pingavgwindow` | Rolling ping window in seconds (default: 60) |
| ᚱ | `hrrefreshvar` | Hashrate graph refresh rate — floor is 0.10 seconds |

Settings are cached in memory and written to `config.json` on save.
**Do not edit `config.json` by hand** unless you speak the machine tongue.

---

## ⚡ Discord War-Horn — The Webhook

To arm the war-horn:

1. Open your Discord server
2. Navigate to **Channel Settings → Integrations → Webhooks**
3. Create a new webhook and copy the URL
4. Paste it into the `discordwebhook` field in Settings
5. The horn screams when `bestSessionDiff` ≥ 50M and a new best is struck

> *Odin does not whisper. Neither does this webhook.*

---

## 🌊 Ping Colours — Reading the Tide

The rolling ping display speaks in colour:

| Colour | Threshold | Omen |
|---|---|---|
| 🟢 GREEN | below 50 ms | Swift as Sleipnir — all is well |
| 🟠 ORANGE | below 120 ms | Bifrost at dusk — watch the horizon |
| 🔴 RED | 120 ms+ | Ragnarök approaches — check your network |

Ping is TCP-born, non-blocking, daemon-threaded.
`pinginflight` stands guard — threads do not pile like corpses.

---

## ᛒ The Tray Daemon — The Unseen Watcher

RavenMiner HQ lives in your system tray when minimised.
Right-click the tray icon to:

- **Show** — summon the longhouse to the foreground
- **⚡ NEW DIFFICULTY** — appears when `bestSessionDiff` surpasses 50M
- **Quit** — extinguish the forge

> *The unseen watcher never sleeps.*

---

## ᛜ Troubleshooting — When Hail Falls

**The widget shows stale ping values**
→ Fixed in v3.9.7+. `t2, f2` are captured before thread exit.
  Ensure you are running the latest version.

**Settings panel crashes on empty alert fields**
→ Fixed in v3.9.5+. `float(raw) or 0` guards the ValueError wolf.
  Update and re-enter your settings.

**The miner IP is not found after settings change**
→ The IP fallback rune `self.cfg.get("minerip", MINERIP)` will
  hold the last known address. Save settings again to re-anchor.

**Hashrate graph refresh is too fast / erratic**
→ The floor is `0.10` seconds (v3.9.6+). Do not set below this.
  The harvest will be crooked if you do.

**Discord webhook is silent**
→ Verify the URL is pasted correctly with no trailing spaces.
  Confirm the difficulty threshold has been crossed (≥ 50M).

---

## ᛞ Packaging — For the Uninitiated

To forge a standalone executable for those who do not speak Python:

```bash
pip install pyinstaller
pyinstaller --onefile --windowed --icon=assets/huginn.ico ravenminer_hq.py
```

The compiled relic will appear in `dist/`.
Carry it to any Windows machine without Python installed.

---

## ᚷ File Structure — The Bones of the Longhouse

```
ravenminer_hq/
├── ravenminer_hq.py     ← The forge itself
├── config.json          ← The sacred scroll (auto-generated)
├── requirements.txt     ← The dependencies of Yggdrasil
├── release_notes.md     ← The chronicle of changes
├── instructions.md      ← This very codex
└── assets/
    ├── huginn.ico        ← Thought, watching from the tray
    └── vegvisir.png      ← The wayfinding sigil
```

---

```
    M       M
   /H\     /M\
  / U \   / U \
 / G   \ /  N  \
/ I     I    I  \
        N        N
/_____RAVENMINER HQ_____\
  ᚠᛖᚺᚢ  ᛏᛁᚹᚨᛉ  ᛟᛞᛁᚾᚾ
```

*May your difficulty be low.*
*May your uptime be eternal.*
*The ravens watch. The Allfather approves.*

**R A V E N M I N E R H Q**
ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ — ᛏ ᛒ ᛗ — ᛜ ᛞ ᛟ
