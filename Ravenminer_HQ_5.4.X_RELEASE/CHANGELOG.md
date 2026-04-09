# ᚲᚺᚨᚾᚷᛖᛚᛟᚷ — RAVENMINER HQ

ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ ᚺ ᚾ ᛁ ᛃ ᛇ ᛈ ᛉ ᛊ ᛏ ᛒ ᛖ ᛗ ᛚ ᛜ ᛞ ᛟ

> *Every rune carved here is a wound healed in the codeforge.*
> *HUGINN remembered the bug. MUNINN remembered the fix.*
> *ODIN merged them both.*

---

## [5.4.0] — ᚢ URUZ · The Forge Reborn
*April 9, 2026*

> *The hammer is no longer silent.*
> *The forge glows gold. The runes rise. The title breathes.*

### ✦ Added

- **ᚢ URUZ — Viking Regular Title Font**
  `_load_viking_font()` scans the script directory, working directory,
  `./fonts/`, `%LOCALAPPDATA%\Microsoft\Windows\Fonts\`, and
  `C:\Windows\Fonts\` for `Viking.ttf` (and common filename variants).
  When found, the font is registered privately via
  `ctypes.windll.gdi32.AddFontResourceExW` and `WM_FONTCHANGE` is broadcast
  so tkinter can use it by family name. Falls back gracefully through
  Palatino Linotype → Book Antiqua → Georgia.

- **ᛈ PERTHO — Pulsing Gold Title Animation**
  `_animate_title_pulse()` fires every 40 ms (25 fps) and interpolates the
  title label colour through eight gold keyframes:
  `#c9a84c → #e8c060 → #f0c040 → #ffd966 → #fff0a0 → #ffd966 → #f0c040 → #e8c060`.
  Peak at near-white-gold `#fff0a0` — sunlight on raw metal.

- **ᛟ OTHALA — Animated Vegvisir Compass Widget**
  A `tk.Canvas`-based Vegvisir replaced the static `᛭` glyph:
  - Rotates a 16-rune ring (full Elder Futhark) around the outer edge
  - Pulses 8 alternating gold / purple spokes via sine-wave brightness
  - Breathes a pulsing outer ring between `PURPLE_DIM` and `PURPLE_GL`
  - Centre `᛭` glyph glows gold on its own slower sine cycle

- **ᚱ RAIDHO — Rune Particle Canvas**
  A drifting Elder Futhark particle field scrolls beneath the title bar.
  Each particle follows an independent sine-wave phase, fading in and out
  through dim purple hues — ambient, never distracting.

- **ᚷ GEBO — Animated GlowLine Title Borders**
  Two `tk.Canvas` gradient lines bookend the title bar. Top sweeps
  `PURPLE → GOLD → PURPLE_GL`; bottom sweeps `GOLD → GOLD_BR → PURPLE_GL`
  at a different speed and phase offset.

- **ᚹ WUNJO — Icon Chooser with Canvas Preview**
  Full icon picker rebuilt with a 64×64 live canvas preview:
  - PIL renders `.ico` / `.png` / `.jpg` / `.bmp` preview when available
  - Animated rune placeholder (`ᚱ` breathes purple) when no icon is set
  - File-extension rune fallback when PIL is not installed
  - `✕ clear` button to remove selection

- **⚒ TIWAZ — Forge Button Idle Pulse**
  The `⚒ FORGE` button breathes gold → amber → gold when idle.
  Sine-wave cycle: `#f0c040 → #aa8000 → #f0c040` at 55 ms intervals.
  Pulse pauses while a build is running.

- **ᚾ NAUTHIZ — Step Row Cyan Pulse**
  Active build steps pulse cyan — spinner icon cycles `CYAN_DIM → CYAN`
  while the step runs. Green / red lock-in on completion / failure.

- **ᚲ KENAZ — Console Rune Ticker**
  A single Elder Futhark rune in the console header cycles through dim
  palette colours — ambient heartbeat of the forge.

- **ᛊ SOWILO — Side Rune Banners**
  Flanking rune columns (`ᚠᚢᚨᚱᚲ` / `ᚷᚹᚺᚾᛁ`) added to the title bar.
  Each column rotates and dim-cycles independently at 720 ms intervals.

### ✦ Fixed

- **BUG-F01 — Frozen .exe Re-Launch Loop**
  When packaged with PyInstaller, `sys.executable` pointed to `ravenforge.exe`
  instead of `python.exe`. Every `pip install` and `pyinstaller` subprocess
  was re-launching RavenForge instead of calling Python. Fixed by resolving
  `PYTHON_EXE` at startup: `shutil.which("python")` when `sys.frozen` is set,
  `sys.executable` otherwise. All 8 subprocess calls now use `PYTHON_EXE`.

---

## [5.2.10] — ᛟ OTHALA · The Longhouse Complete
*April 5, 2026*

> *Every column speaks. Every gauge breathes.*
> *The longhouse is no longer a monitor — it is a living instrument.*

### ✦ Added

- **ᚷ GEBO — Source Code Viewer**
  A syntax-highlighted source reader built directly into the app. Opens the
  running `.py` file in a scrollable `tk.Text` window with full Elder Futhark
  theming: keywords in lavender `#cc99ff`, strings in `#a8ff78`, comments in
  italic `#555577`, numbers in gold `#ffcc44`, definitions in GOLDBRIGHT bold.
  Horizontal and vertical scrollbars. Line count displayed in the footer.

- **ᛜ INGWAZ — AVGWINDOW Rolling Average Entry**
  A new bottom-bar entry (orange) controls the rolling average window in seconds
  for CURRENT (A) and CORE VOLTAGE (mV). Defaults from the `AVGWINDOW` global.
  Live update — no restart required.

- **ᛒ BERKANO — WiFi RSSI + SSID Display**
  Right column now shows live WiFi signal strength in dBm, colour-coded:
  GREEN `> -60 dBm`, ORANGE `-60` to `-75 dBm`, RED `< -75 dBm`.
  Network name (SSID) displayed beneath the RSSI value.

- **ᚠ FEHU — Fan Speed % Display**
  Fan speed percentage shown in the right column, colour-coded by severity:
  GREEN `< 70%`, ORANGE `70–90%`, RED `≥ 90%`. Animation speed of the fan
  indicator scales with actual `fanspeed` value (`fananimspeed`).

### ✦ Changed

- **ᛞ DAGAZ — VOLTAGE Gauge Added to Left Column**
  A fourth analogue gauge (GREEN needle, `warn 11.9 V`, `crit 11.5 V`,
  `lo 10.0 V`, `hi 13.5 V`, `voltagemode=True`) fills the left column beneath
  the VR gauge. Input voltage is now as visible as temperature.

- **ᚾ NAUTHIZ — CURRENT Gauge Added to Left Column**
  A fifth analogue gauge (ORANGE needle, `warn 10.0 A`, `crit 12.0 A`,
  `lo 0.0 A`, `hi 15.0 A`, `currmode=True`) anchors the left column.
  Rolling average over `AVGWINDOW` seconds displayed beside the raw reading.

- **ᚲ KENAZ — Core Voltage Rolling Average**
  `lblvcore` now displays the rolling mean of `coreVoltageActual` over the
  `AVGWINDOW` window. Raw value used as fallback when history is empty.

- **ᚱ RAIDHO — Current (A) Rolling Average**
  `lblcurrent` displays the rolling mean of `currentA` over `AVGWINDOW`.
  Colour-coded: GREEN `≤ 10 A`, ORANGE `> 10 A`.

---

## [5.2.9] — ᛏ TIWAZ · The Reboot Made Honest
*April 4, 2026*

> *When the forge goes cold it does not pretend to breathe.*
> *The dashboard falls silent the moment the command is sent.*

### ✦ Fixed

- **ᚹ WUNJO — Reboot Forces `isonline=False` Immediately**
  After a reboot command is issued from Settings, `stoplivepulse()` and
  `stopgoldpulse()` are now called immediately on the dashboard object, forcing
  `isonline=False` and resetting `offlinecount=0` before the miner goes dark.
  Previously the dashboard pulsed LIVE green for up to one full poll interval
  after the reboot was triggered.

- **ᛊ SOWILO — Reboot Slide-to-Confirm + 2s Hold Guard**
  The reboot button in Settings is now a two-stage slider. The user must:
  (1) enable the toggle switch, (2) slide the bar to 100, (3) hold for 2 seconds.
  Releasing early cancels the hold timer. `rebootholdid` guards against
  accidental double-fires. Label states: `OFF` → `HOLD — rebooting...`.

---

## [5.2.8] — ᛒ BERKANO · The Best-Diff Breathes Blue
*April 4, 2026*

> *The difficulty counter no longer merely counts.*
> *It breathes. It warns. It pulses with the tide.*

### ✦ Added

- **ᛁ ISA — Best-Diff Slow Blue Breathe**
  `bddiffphase` (sine phase, `float`) drives a slow breathing animation on the
  Best-Diff label. `bddiffpulse()` fires every 300 ms via `root.after`.
  Colour cycles gently through a blue sine wave — calm when low, brightening
  as the number climbs.

- **ᚱ RAIDHO — Best-Diff Red Bounce Alert**
  `bdredalpha` and `bdreddir` drive a fast red bounce when the Best-Diff label
  enters an alert state. `bdreduntil` (epoch float) controls duration.
  The label snaps back to blue breathe when the alert window expires.

- **ᚾ NAUTHIZ — Best-Diff String Tracking**
  `lastbdtext` (`str`) tracks the last rendered Best-Diff string. Prevents
  unnecessary canvas redraws when the value has not changed between ticks.

### ✦ Changed

- **ᛟ OTHALA — Best-Diff Label Colour**
  Best-Diff value label is now bright blue `#00aaff` (was GOLD `#c9a84c`).
  The new colour distinguishes it from share counts and pairs with the blue
  breathe pulse animation.

---

## [5.2.5] — ᚺ HAGALAZ · The Runes Flank the Diff
*April 3, 2026*

> *Hail fell on the diff counter and the runes rose to guard it.*
> *Left and right — Fehu and Sowilo — cycling, never in sync.*

### ✦ Added

- **ᛖ EHWAZ — Best-Diff Flanking Rune Animation**
  Two cycling rune labels (`lblbestdiffrunel`, `lblbestdiffruner`) flank the
  Best-Diff value. Left starts at FEHU (index 0), right starts at SOWILO
  (index 12) so they are never in sync. Both cycle through the full Elder
  Futhark independently. Font: `Segoe UI, 40, bold`, colour: GOLDBRIGHT.

- **ᚲ KENAZ — CONNECTION LOST Fires on Startup**
  `pulsebars()` now checks `isonline` before rendering the bar graph,
  regardless of whether `hrhistory` is populated. On startup with no miner
  reachable, `CONNECTION LOST` in red appears immediately at first render
  (200 ms after launch) rather than waiting for history to accumulate.

### ✦ Fixed

- **BUG-05 — Left and Right Best-Diff Rune Index Stagger**
  `bdrunelidx` and `bdruneridx` initialised at 0 and 12 respectively.
  `bdrunefadeout_l` and `bdrunefadeout_r` scheduled at 600 ms and 2200 ms
  after build to stagger the first fade pair, preventing lockstep animation.

---

## [5.2.2] — ᛃ JERA · The Dead Widget Falls
*April 3, 2026*

> *A label that was never seen should never have been bound.*
> *The status bar is gone. The forge is quieter for it.*

### ✦ Removed

- **ᛊ SOWILO — `lblstatus` Widget Removed**
  The bottom-bar status label (`lblstatus`) was removed entirely. All
  `tryexcept` guards wrapping `self.lblstatus.config(...)` calls have been
  stripped. References replaced by the `pulsebars()` / `livetick()` visual
  feedback system already in place.

---

## [5.2.1] — ᚱ RAIDHO · Dead Weight Cast Into the Void
*April 3, 2026*

> *What was never called should never have remained.*
> *The codeforge is lean. The ravens fly true.*

### ✦ Removed

- **ᚱ RAIDHO — Dead Function `_upd_pool_info()` Purged**
  This 12-line method was defined but never called anywhere in the codebase.
  It also held the wrong API key (`stratum_User` vs `stratumUser`), causing a
  phantom double-write to `lbl_uptime` and `lbl_pool_user` on every poll cycle
  had it ever been wired up. 15 lines of dead runes returned to the void.

### ✦ Fixed

- **BUG-B — `[WM]` Debug Print Removed**
  `print("[WM] watermark drawn on canvas successfully")` fired every time the
  Settings panel opened. Console noise eliminated.

- **BUG-C — Credentials Leak Sealed**
  `print("[APPLY] Sending:", data)` was printing miner IP, pool credentials,
  voltage and frequency settings in plain text on every settings save. Removed.

- **BUG-D — HTTP Debug Print Removed**
  `print(f"[APPLY] PATCH {url} -> {resp.status_code}")` removed.
  Internal HTTP calls are not production console output.

---

## [5.2.0] — ᚨ ANSUZ · The Voice That Needs No Platform
*April 3, 2026*

> *The war-horn was reborn. It no longer needs Discord to scream.*
> *A single HTTP whisper reaches any phone in any realm.*

### ✦ Added

- **ᚨ ANSUZ — ntfy.sh Push Notification System**
  Discord webhooks fully replaced with `ntfy.sh`. No account required on the
  public server. Single HTTP POST to `https://ntfy.sh/your-secret-topic`
  delivers native push alerts to iOS and Android. Self-hosting supported.

- **ᛜ INGWAZ — Per-Alert Priority & Emoji Tags**

  | Alert | Priority | Tags |
  |---|---|---|
  | 🔥 MINER OVERHEAT | `high` | `fire,rotating_light` |
  | 🟠 VR OVERHEAT | `high` | `fire,orange_circle` |
  | ⚠️ MINER OFFLINE | `high` | `warning,red_circle` |
  | ⛏️ BLOCK FOUND | `high` | `trophy,tada` |
  | ❌ REJECTED SPIKE | `default` | `x,warning` |
  | 📉 LOW HASHRATE | `default` | `chart_with_downwards_trend` |
  | 🏆 NEW MILESTONE | `default` | `trophy,sparkles` |
  | ✅ TEST ALERT | `default` | `white_check_mark` |

- **ᛏ TIWAZ — TEST NOTIFY Button in Settings**
  Settings panel now shows **▶  TEST NOTIFY  (ntfy.sh)**.

### ✦ Changed

- **ᚱ RAIDHO — Config Key Renamed**
  `discord_webhook` → `ntfy_topic` in `ravenminer_alerts.json`.

- **ᛒ BERKANO — Settings Section Relabelled**
  "DISCORD ALERTS" → "NTFY.SH ALERTS".

- **ᛟ OTHALA — Raven Pair Repositioned**
  Both ravens lowered 24 px — no longer clipping the top bar.

### ✦ Fixed

- **BUG-FIX — `send_ntfy_alert()` Latin-1 Header Encoding**
  Emoji in `Title` header caused `UnicodeEncodeError`. Non-ASCII stripped from
  Title only; emoji preserved via `Tags` field.

- **BUG-FIX — Stale `color=` kwargs on ntfy calls** (milestone + test button)
- **BUG-FIX — `IndentationError` in Milestone Block** (`py_compile` clean)
- **BUG-FIX — `lbl_refresh_stat` AttributeError Spam** (`getattr` guard applied)

---

## [4.0.0] — ᛞ DAGAZ · Dawn of the New Forge

> *The sun rose over Yggdrasil. The old serpent shed its skin.*

### ✦ Added

- **ᛗ MANNAZ — Clickable Email in Header** (`sonofodin@outlook.com`, `cursor="hand2"`)
- **ᛜ INGWAZ — Difficulty Milestone Alerts** (every 50M crossed, fires once)
- **ᛞ DAGAZ — Session Milestone Reset** (resets when `bestDiff < lastBestDiff × 0.5`)

### ✦ Changed

- **ᚱ RAIDHO — `webbrowser` Import Moved Earlier** (hoisted to top of `build()`)

### ✦ Fixed

- **ᚲ KENAZ — Version Label GitHub Link Preserved**

---

## [3.9.9] — ᛟ OTHALA · The Ancestral Hall Fortified

### ✦ Added
- **ᚾ NAUTHIZ — Alert on New Best Difficulty ≥ 50M**
- **ᛏ TIWAZ — TCP-Connect Ping with Adjustable Rolling Average**

### ✦ Fixed
- **ᛊ SOWILO — Thread-Safe Ping Capture Before Exit**

---

## [3.9.8] — ᛒ BERKANO · The Branch Reaches Further

### ✦ Added
- **ᚷ GEBO — Pool User Display on Ping Row**

### ✦ Fixed
- **ᚹ WUNJO — Firmware Label Placement Stabilised**

---

## [3.9.7] — ᚺ HAGALAZ · Hail Fell, Was Endured

### ✦ Added
- **ᛁ ISA — NEW DIFFICULTY Tray Popup**

### ✦ Fixed
- **ᚠ FEHU — Thread Exit Value Capture**

---

## [3.9.6] — ᛃ JERA · The Harvest Corrected

### ✦ Fixed
- **BUG1 FIX — HR Refresh Var Wrong Reference**

---

## [3.9.5] — ᛜ INGWAZ · The Seed of Stability

### ✦ Added
- **ᚾ NAUTHIZ — Network Ping Display**
- **ᚨ ANSUZ — Non-Blocking Ping Thread**

### ✦ Fixed
- **BUG3 FIX — Non-Numeric Alert Field Guard**
- **FIX5 — Live Settings IP Fallback**

---

## [3.9.4] — ᛟ OTHALA · The Foundation Stone

> *The longhouse was raised from raw timber and rune-carved beams.*

### ✦ Added
- **ᚠ FEHU — Initial Release**
  Core architecture: three-column layout, animated hashrate bar graph,
  Vegvisir watermark, Huginn & Muninn raven pair, system tray daemon,
  alert system, BTC price, rejection % display, cached alert config.

---

ᚠᛖᚺᚢ ᛏᛁᚹᚨᛉ ᛟᛞᛁᚾᚾ
May your difficulty be low and your uptime eternal.
The ravens watch. The Allfather approves.
R A V E N M I N E R H Q — ᚲᚺᚨᚾᚷᛖᛚᛟᚷ
ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ — ᛏ ᛒ ᛗ — ᛜ ᛞ ᛟ
