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
python Ravenminer_HQ_5.2.1.py
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
| ᚨ | `ntfy_topic` | ntfy push URL — e.g. `https://ntfy.sh/your-secret-topic` |
| ᛏ | `pingavgwindow` | Rolling ping window in seconds (default: 60) |
| ᚱ | `hrrefreshvar` | Hashrate graph refresh rate — floor is 0.10 seconds |

Settings are cached in memory and written to `ravenminer_alerts.json` on save.
**Do not edit JSON files by hand** unless you speak the machine tongue.

---

## ⚡ ntfy.sh — The New War-Horn

Discord has been replaced with **ntfy.sh** — a free, open-source push
notification service. No account required. One HTTP POST, any phone on Earth.

**To arm the war-horn:**

1. Install the **ntfy** app on your phone — Android (Play Store / F-Droid) or iOS
2. Choose a secret topic name — make it long and random:
   `https://ntfy.sh/ravenminer-alan-x7q9mz3p`
3. Open Settings in RavenMiner HQ → **NTFY.SH ALERTS**
4. Paste the full URL into the **ntfy Topic URL** field
5. Click **▶  TEST NOTIFY  (ntfy.sh)** — your phone should buzz within seconds
6. Save settings

> *Your topic name is your password on the public server.*
> *For maximum privacy, self-host ntfy on your own machine — change the URL to*
> *`http://192.168.x.x/your-topic` and nothing leaves your network.*

**Alerts that will reach your phone:**

| Alert | When | Priority |
|---|---|---|
| 🔥 MINER OVERHEAT | ASIC temp ≥ threshold | High |
| 🟠 VR OVERHEAT | VR temp ≥ threshold | High |
| ⚠️ MINER OFFLINE | 6 consecutive failed polls | High |
| ⛏️ BLOCK FOUND | New block confirmed | High |
| ❌ REJECTED SPIKE | ≥ 5 shares rejected | Default |
| 📉 LOW HASHRATE | Hashrate < threshold | Default |
| 🏆 NEW MILESTONE | Every 50M difficulty crossed | Default |

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

**ntfy test alert sent but phone does not buzz**
→ Confirm the ntfy app is installed and subscribed to your exact topic name.
  The topic name is case-sensitive. Check for trailing spaces in the URL field.

**ntfy alert error: codec can't encode character**
→ Fixed in v5.2.1. Emoji are now carried by the `Tags` field, not the header.
  Update to v5.2.1 if you see this error.

**The widget shows stale ping values**
→ Fixed in v3.9.7+. Ensure you are running the latest version.

**Settings panel crashes on empty alert fields**
→ Fixed in v3.9.5+. `float(raw) or 0` guards the ValueError wolf.

**The miner IP is not found after settings change**
→ The IP fallback rune `self.cfg.get("minerip", MINERIP)` holds the last known
  address. Save settings again to re-anchor.

**Hashrate graph refresh is too fast / erratic**
→ The floor is `0.10` seconds (v3.9.6+). Do not set below this.

**`[RavenMiner] ignored error: lbl_refresh_stat` spam in console**
→ Fixed in v5.2.1. The widget guard was missing. Update to v5.2.1.

---

## ᛞ Packaging — For the Uninitiated

To forge a standalone executable for those who do not speak Python:

```bash
pip install pyinstaller
pyinstaller --onefile --windowed --icon=assets/huginn.ico Ravenminer_HQ_5.2.1.py
```

The compiled relic will appear in `dist/`.
Carry it to any Windows machine without Python installed.

---

## ᚷ File Structure — The Bones of the Longhouse

```
ravenminer_hq/
├── Ravenminer_HQ_5.2.1.py   ← The forge itself
├── ravenminer_config.json    ← The sacred scroll (auto-generated)
├── ravenminer_alerts.json    ← Alert thresholds & ntfy topic (auto-generated)
├── requirements.txt          ← The dependencies of Yggdrasil
├── CHANGELOG.md              ← Every rune carved since the beginning
├── Release-Notes.md          ← The chronicle of this release
├── instructions.md           ← This very codex
└── assets/
    ├── huginn.ico             ← Thought, watching from the tray
    └── vegvisir.png           ← The wayfinding sigil
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
