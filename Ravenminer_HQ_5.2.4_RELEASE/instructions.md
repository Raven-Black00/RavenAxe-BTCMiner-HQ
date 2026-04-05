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
python Ravenminer_HQ_5_2_10.py
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

## 🔁 Reboot — The Slide-to-Confirm Guard

The reboot control in Settings requires three deliberate steps to fire:

1. **Enable the toggle switch** — the label turns RED reading `ON`
2. **Slide the bar to 100** — the label reads `## %` as you drag
3. **Hold at 100 for 2 seconds** — the label reads `HOLD — rebooting...`

Releasing the slider before the 2-second hold expires cancels the reboot.
The moment a reboot is confirmed, the dashboard immediately shows
`CONNECTION LOST` — the forge does not pretend the miner is still breathing.

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

## 📊 The Five Gauges — Left Column

The left column now displays five analogue arc gauges:

| Gauge | Colour | Warn | Crit |
|---|---|---|---|
| ASIC TEMP | ORANGE | 55°C | 70°C |
| VR TEMP | CYAN | 50°C | 65°C |
| VOLTAGE | GREEN | 11.9 V | 11.5 V (lo: 10.0, hi: 13.5) |
| CURRENT | ORANGE | 10.0 A | 12.0 A (lo: 0.0, hi: 15.0) |

Each gauge needle turns RED when the critical threshold is crossed.

---

## 🔄 Rolling Averages — The Avg Window

The bottom bar has four configurable entries (right to left):

| Entry | Colour | Controls |
|---|---|---|
| `Refresh s` | CYAN | Main API poll interval (floor 0.10 s) |
| `Graph s` | GOLD | Hashrate bar graph redraw rate (floor 0.10 s) |
| `Ping avg s` | TEAL | Ping rolling average window |
| `Avg s` | ORANGE | CURRENT (A) + CORE VOLTAGE (mV) rolling average window |

Type a new value and press `Return` or click away. Floors and ceilings
are enforced — the field resets if you enter an illegal value.

---

## 📶 WiFi Signal — Reading the Ether

The right column shows the miner's WiFi RSSI and SSID live:

| Colour | Threshold | Omen |
|---|---|---|
| 🟢 GREEN | > -60 dBm | Strong — the ether is clear |
| 🟠 ORANGE | -60 to -75 dBm | Marginal — watch for drop-outs |
| 🔴 RED | < -75 dBm | Weak — the signal frays |

If RSSI shows `---`, your NerdQaxe firmware does not expose `wifiRSSI`.
Update firmware or treat as informational.

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

## 🔵 Best-Diff Pulse — The Breathing Counter

The Best-Diff value breathes in **blue** (`#00aaff`) when no new record
is being set — a slow sine-phase animation driven by `bddiffpulse()`.

When a **new personal best** is registered:
- A fast **red bounce** fires for a short window
- The bounce expires (`bdreduntil` epoch) and the label returns to blue breathe
- Two gold **flanking runes** cycle through the Elder Futhark, left and right,
  never in sync

---

## ᛒ The Tray Daemon — The Unseen Watcher

RavenMiner HQ lives in your system tray when minimised.
Right-click the tray icon to:

- **Show** — summon the longhouse to the foreground
- **⚡ NEW DIFFICULTY** — appears when `bestSessionDiff` surpasses 50M
- **Quit** — extinguish the forge

> *The unseen watcher never sleeps.*

---

## 📜 Source Code Viewer

The in-app source viewer opens the running `.py` file in a syntax-highlighted
scrollable window. Features:

- **Keywords** — lavender `#cc99ff`
- **Strings** — green `#a8ff78`
- **Comments** — italic grey `#555577`
- **Numbers** — gold `#ffcc44`
- **`def` / `class`** — GOLDBRIGHT bold

The viewer is read-only. Horizontal and vertical scrollbars included.
Line count shown in the footer.

---

## ᛜ Troubleshooting — When Hail Falls

**ntfy test alert sent but phone does not buzz**
→ Confirm the ntfy app is installed and subscribed to your exact topic name.
  The topic name is case-sensitive. Check for trailing spaces in the URL field.

**Voltage / Current gauges show 0 or ---**
→ Your NerdQaxe firmware may not expose `coreVoltageActual` / `currentA`.
  Update to the latest NerdQaxe++ firmware.

**WiFi RSSI shows --- dBm**
→ Firmware does not expose `wifiRSSI`. Ignore or update firmware.

**Reboot slider won't fire**
→ You must (1) enable the toggle, (2) slide to 100, AND (3) hold for 2 seconds.
  Releasing early cancels. This is intentional.

**Dashboard still shows LIVE after reboot command**
→ Fixed in v5.2.9. Update to current version if still occurring.

**ntfy alert error: codec can't encode character**
→ Fixed in v5.2.0. Emoji are now carried by the `Tags` field, not the header.

**`[RavenMiner] ignored error: lbl_refresh_stat` spam in console**
→ Fixed in v5.2.1. Update to current version.

**The miner IP is not found after settings change**
→ The IP fallback rune `self.cfg.get("minerip", MINERIP)` holds the last known
  address. Save settings again to re-anchor.

**Hashrate graph refresh is too fast / erratic**
→ The floor is `0.10` seconds. Do not set below this.

---

## ᛞ Packaging — For the Uninitiated

To forge a standalone executable for those who do not speak Python:

```bash
pip install pyinstaller
pyinstaller --onefile --windowed --icon=assets/huginn.ico Ravenminer_HQ_5_2_10.py
```

The compiled relic will appear in `dist/`.
Carry it to any Windows machine without Python installed.

---

## ᚷ File Structure — The Bones of the Longhouse

```
RavenAxe-BTCMiner-HQ/
├── Ravenminer_HQ_5_2_10.py  ← The forge itself
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
