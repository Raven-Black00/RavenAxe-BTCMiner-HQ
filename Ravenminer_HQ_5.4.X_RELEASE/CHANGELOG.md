# ᚲᚺᚨᚾᚷᛖᛚᛟᚷ — RAVENMINER HQ

ᚠ ᚢ ᚨ ᚱ ᚲ ᚷ ᚹ ᚺ ᚾ ᛁ ᛃ ᛇ ᛈ ᛉ ᛊ ᛏ ᛒ ᛖ ᛗ ᛚ ᛜ ᛞ ᛟ

> *Every rune carved here is a wound healed in the codeforge.*
> *HUGINN remembered the bug. MUNINN remembered the fix.*
> *ODIN merged them both.*

---

## [5.4.9] — ᛈ PERTHO · The Pulse Made Visible
*April 10, 2026*

> *The ping no longer merely counts.*
> *It breathes. It spikes. It traces the heartbeat of the network.*

### ✦ Added

- **ᛈ PERTHO — ECG Heart-Rate Ping Graph**
  A `tk.Canvas` ECG-style waveform graph now lives below the ping value.
  The graph pulls directly from the rolling ping history buffer — every
  sample that feeds the rolling average also feeds the waveform. No fake
  animation data; it is the real pulse of your miner's network.

- **ᚺ HAGALAZ — Three-Pass Glow Rendering (PIL Path)**
  When Pillow is available, the ping graph uses the same supersampled
  rendering pipeline as the hashrate history graph:
  - 2× LANCZOS supersampled canvas — crisp, anti-aliased at any DPI
  - **Haze pass**: 14 px wide, 52% brightness — outer diffuse glow
  - **Bloom pass**: 6 px wide, 88% brightness — tight bloom ring
  - **Core pass**: 2 px wide, 100% brightness — razor sharp line
  - Data-point dots every 3rd sample — coloured ring + white centre fill
  - `_ping_line_photo` GC guard prevents premature garbage collection

- **ᚠ FEHU — Tkinter Fallback Renderer**
  When Pillow is absent, a three-pass plain tkinter renderer activates:
  7 px / 3 px / 1 px width passes with matching brightness ratios.
  Oval data dots with white centres — consistent look, no PIL required.

- **ᛚ LAGUZ — Latency Colour Bands**
  The graph and fill area colour-code automatically by current ping latency:

  | Band | Threshold | Line colour | Fill colour |
  |---|---|---|---|
  | Swift | < 50 ms | `#00ffcc` cyan | `#003322` |
  | Marginal | < 120 ms | `#ffaa00` orange | `#2a1400` |
  | Critical | ≥ 120 ms | `#ff3344` red | `#2a0008` |

### ✦ Changed

- **ᚾ NAUTHIZ — Ping Label — "ms" Suffix Removed**
  The ping value label now displays the numeric value only (e.g. `42`)
  instead of `42 ms`. The ECG graph serves as the unit indicator.
  Both the initialisation string (`'---'`) and the live update path
  (`f'{avg_ms}'`) have been updated.

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

- **ᛊ SOWILO — Reboot Slide-to-Confirm + 2s Hold Guard**
  The reboot button in Settings is now a two-stage slider. The user must:
  (1) enable the toggle switch, (2) slide the bar to 100, (3) hold for 2 seconds.
  `rebootholdid` guards against accidental double-fires.

---

## [5.2.8] — ᛒ BERKANO · The Best-Diff Breathes Blue
*April 4, 2026*

### ✦ Added

- **ᛁ ISA — Best-Diff Slow Blue Breathe**
- **ᚱ RAIDHO — Best-Diff Red Bounce Alert**
- **ᚾ NAUTHIZ — Best-Diff String Tracking**

### ✦ Changed

- **ᛟ OTHALA — Best-Diff Label Colour → `#00aaff`**

---

## [5.2.5] — ᚺ HAGALAZ · The Runes Flank the Diff
*April 3, 2026*

### ✦ Added

- **ᛖ EHWAZ — Best-Diff Flanking Rune Animation** (FEHU left, SOWILO right)
- **ᚲ KENAZ — CONNECTION LOST Fires on Startup**

---

## [5.2.2] — ᛃ JERA · The Dead Widget Falls
*April 3, 2026*

### ✦ Removed

- **ᛊ SOWILO — `lblstatus` Widget Removed**

---

## [5.2.1] — ᚱ RAIDHO · Dead Weight Cast Into the Void
*April 3, 2026*

### ✦ Removed / Fixed

- Dead function `_upd_pool_info()` purged
- `[WM]` debug print removed
- Credentials leak `[APPLY] Sending: {data}` sealed
- HTTP debug print removed

---

## [5.2.0] — ᚨ ANSUZ · The Voice That Needs No Platform
*April 3, 2026*

### ✦ Added

- **ᚨ ANSUZ — ntfy.sh Push Notification System** (Discord webhooks replaced)
- **ᛜ INGWAZ — Per-Alert Priority & Emoji Tags**
- **ᛏ TIWAZ — TEST NOTIFY Button in Settings**

---

## [4.0.0] — ᛞ DAGAZ · Dawn of the New Forge

- Clickable email header, difficulty milestone alerts, session milestone reset

---

## [3.9.4]–[3.9.9] — Foundation through Fortification

| Version | Rune | Key Change |
|---|---|---|
| 3.9.9 | ᛟ OTHALA | Rolling TCP ping · difficulty ≥ 50M alert |
| 3.9.8 | ᛒ BERKANO | Pool user display · firmware label fix |
| 3.9.7 | ᚺ HAGALAZ | Tray difficulty popup · thread exit fix |
| 3.9.6 | ᛃ JERA | HR refresh var bug fix |
| 3.9.5 | ᛜ INGWAZ | Ping display · stability · IP fallback |
| 3.9.4 | ᛟ OTHALA | **Foundation** — first rune carved |

---

<p align="center">
  <em>ᚠᚢᚦᚨᚱᚲ — May your hashes flow true and your blocks be found</em>
</p>
