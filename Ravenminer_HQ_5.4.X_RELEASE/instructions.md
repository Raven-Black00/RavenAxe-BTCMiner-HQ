# RAVENMINER HQ — Instructions
### ᚱᚨᚹᛖᚾ · The Keeper's Codex

> *The longhouse does not run itself.*
> *Read these runes before you light the forge.*

---

## ᛟ Requirements — What the Forge Demands

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
python Ravenminer_HQ_5_4_9.py
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
> *For maximum privacy, self-host ntfy on your own machine.*

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

Type a new value and press `Return` or click away.

---

## 💓 Ping ECG Graph — The Heartbeat Display

The bottom bar now shows a living ECG waveform below the ping value.

- The number displays raw rolling-average ping (no `ms` suffix — the waveform speaks for itself)
- The graph reads from the same ping history buffer as the rolling average
- Colours automatically by current latency:

| Colour | Threshold | Omen |
|---|---|---|
| 🟢 Cyan `#00ffcc` | < 50 ms | Swift as Sleipnir — all is well |
| 🟠 Orange `#ffaa00` | < 120 ms | Bifrost at dusk — watch the horizon |
| 🔴 Red `#ff3344` | ≥ 120 ms | Ragnarök approaches — check your network |

When Pillow is installed, the graph uses 2× LANCZOS supersampling and
three-pass glow rendering (haze → bloom → core line) with white-centred
data dots every 3rd sample — the same pipeline as the hashrate history graph.

---

## 📶 WiFi Signal — Reading the Ether

| Colour | Threshold | Omen |
|---|---|---|
| 🟢 GREEN | > -60 dBm | Strong — the ether is clear |
| 🟠 ORANGE | -60 to -75 dBm | Marginal — watch for drop-outs |
| 🔴 RED | < -75 dBm | Weak — the signal frays |

---

## 🔵 Best-Diff Pulse — The Breathing Counter

The Best-Diff value breathes in **blue** (`#00aaff`) at rest.
On a **new personal best**: fast red bounce fires, then returns to blue breathe.
Two gold flanking runes cycle through the Elder Futhark, never in sync.

---

## ᛒ The Tray Daemon — The Unseen Watcher

RavenMiner HQ lives in your system tray when minimised.
Right-click the tray icon to:

- **Show** — summon the longhouse to the foreground
- **⚡ NEW DIFFICULTY** — appears when `bestSessionDiff` surpasses 50M
- **Quit** — extinguish the forge

---

## 📜 Source Code Viewer

| Highlight | Colour |
|---|---|
| Keywords | Lavender `#cc99ff` |
| Strings | Green `#a8ff78` |
| Comments | Italic grey `#555577` |
| Numbers | Gold `#ffcc44` |
| `def` / `class` | GOLDBRIGHT bold |

---

## ᛜ Troubleshooting — When Hail Falls

**ntfy test alert sent but phone does not buzz**
→ Confirm the ntfy app is installed and subscribed to your exact topic name.
  The topic name is case-sensitive.

**Voltage / Current gauges show 0 or ---**
→ Your NerdQaxe firmware may not expose `coreVoltageActual` / `currentA`.
  Update to the latest NerdQaxe++ firmware.

**WiFi RSSI shows --- dBm**
→ Firmware does not expose `wifiRSSI`. Ignore or update firmware.

**Reboot slider won't fire**
→ You must (1) enable the toggle, (2) slide to 100, AND (3) hold for 2 seconds.
  Releasing early cancels. This is intentional.

**Ping graph is flat / blank**
→ Requires at least 2 successful TCP pings. Confirm miner IP is reachable.
  Install Pillow (`pip install Pillow`) for the supersampled renderer.

**Dashboard still shows LIVE after reboot command**
→ Fixed in v5.2.9. Update to current version if still occurring.

---

## ᛞ Packaging — For the Uninitiated

```bash
pip install pyinstaller
pyinstaller --onefile --windowed --icon=assets/huginn.ico Ravenminer_HQ_5_4_9.py
```

Or use **RavenForge** (`python ravenforge_v2.py`) — the animated GUI build assistant.

---

## ᚷ File Structure — The Bones of the Longhouse

```
RavenAxe-BTCMiner-HQ/
├── Ravenminer_HQ_5_4_9.py   ← The forge itself
├── ravenforge_v2.py           ← The animated build assistant
├── ravenminer_config.json     ← The sacred scroll (auto-generated)
├── ravenminer_alerts.json     ← Alert thresholds & ntfy topic (auto-generated)
├── requirements.txt           ← The dependencies of Yggdrasil
├── CHANGELOG.md               ← Every rune carved since the beginning
├── Release-Notes.md           ← The chronicle of this release
├── instructions.md            ← This very codex
├── RavenForge_Instructions.md ← RavenForge usage guide
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

**R A V E N M I N E R  H Q  v 5 . 4 . 9**
ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ — ᛏ ᛒ ᛗ — ᛜ ᛞ ᛟ
