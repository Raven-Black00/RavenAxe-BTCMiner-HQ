# RAVENMINER HQ — Release Notes

---

## [5.2.10] — ᛟ OTHALA · The Longhouse Complete
*April 5, 2026*

> *Every column speaks. Every gauge breathes.*
> *The longhouse is no longer a monitor — it is a living instrument.*

---

### ⚡ What's New in 5.2.10

This release rounds out the instrument panel with full power telemetry,
WiFi diagnostics, a built-in source code viewer, and rolling-average
controls — making RavenMiner HQ the most complete dashboard the forge has
ever produced.

---

### 📊 New Gauges — Left Column Now Has Five

The left column has grown from two gauges (ASIC + VR temperature) to five:

| Gauge | Colour | Warn | Crit |
|---|---|---|---|
| ASIC TEMP | ORANGE | 55°C | 70°C |
| VR TEMP | CYAN | 50°C | 65°C |
| VOLTAGE | GREEN | 11.9 V | 11.5 V |
| CURRENT | ORANGE | 10.0 A | 12.0 A |

Input voltage and draw current are now as visible as temperature.
All four gauges use the same analogue arc renderer — needle angle,
colour band, and crit flash all fire the same way regardless of metric.

---

### 🔄 Rolling Averages — CURRENT & CORE VOLTAGE

A new **Avg s** entry in the bottom bar (orange, next to the existing
Ping avg and Graph entries) controls the rolling average window for
**CURRENT (A)** and **CORE VOLTAGE (mV)**. Default: `AVGWINDOW` global.

Both values now display the rolling mean over the configured window,
falling back to the raw reading when history is empty. This smooths
out noise from short transients without hiding genuine trends.

---

### 📶 WiFi Diagnostics — RSSI & SSID

The right column now shows two new readouts pulled from the NerdQaxe API:

| Field | Colour coding |
|---|---|
| WiFi RSSI (dBm) | GREEN `> -60`, ORANGE `-60` to `-75`, RED `< -75` |
| WiFi SSID | Plain display — confirms which network the miner is on |

Useful for diagnosing marginal WiFi that causes intermittent offline alerts.

---

### 💨 Fan Speed % Display

Fan speed percentage is now shown in the right column and colour-coded:
- GREEN `< 70 %` — healthy
- ORANGE `70–90 %` — elevated
- RED `≥ 90 %` — critical

The `fananimspeed` value (derived from `fanspeed / 0.18`) drives the
fan indicator animation rate so the visual matches actual RPM feel.

---

### 📜 Source Code Viewer

A new in-app viewer lets you inspect the running `.py` source without
leaving the forge. Features:
- Full syntax highlighting: keywords (lavender), strings (green),
  comments (italic grey), numbers (gold), `def`/`class` (GOLDBRIGHT bold)
- Horizontal + vertical scroll, read-only, search-ready
- Line count in the footer (`N lines — read-only`)

---

## [5.2.9] — ᛏ TIWAZ · The Reboot Made Honest
*April 4, 2026*

> *When the forge goes cold it does not pretend to breathe.*

### 🔁 Reboot Slide-to-Confirm

The reboot control in Settings is now a two-stage slider:
1. Enable the toggle switch
2. Slide the bar to 100
3. Hold for 2 seconds — `HOLD — rebooting...` confirms the timer is armed
4. Release early at any time to cancel

`rebootholdid` guards against double-fires.

### ⚡ Dashboard Goes Dark Immediately

The moment a reboot is confirmed, `isonline=False` is forced on the
dashboard (via `stoplivepulse()` + `stopgoldpulse()`) before the HTTP
POST is even sent. No more green LIVE pulse while the miner is cold.

---

## [5.2.8] — ᛒ BERKANO · The Best-Diff Breathes Blue
*April 4, 2026*

> *The difficulty counter no longer merely counts.*

### 🔵 Best-Diff Blue Breathe Animation

The Best-Diff value label now slowly breathes in blue — a sine-phase
pulse driven by `bddiffphase` and fired every 300 ms. When a new
personal best is registered, a fast **red bounce** fires (`bdredalpha`,
`bdreddir`, `bdreduntil` epoch control) and then falls back to the
slow blue breathe.

The label colour changed from GOLD to bright blue `#00aaff` to match.

---

## [5.2.5] — ᚺ HAGALAZ · The Runes Flank the Diff
*April 3, 2026*

> *Left and right — Fehu and Sowilo — cycling, never in sync.*

### ᚠ Best-Diff Flanking Rune Animation

Two gold rune labels cycle through the full Elder Futhark flanking the
Best-Diff value. Left starts at FEHU (index 0), right at SOWILO (index 12)
so they are permanently out of phase. Font: `Segoe UI 40 bold`. The
fade timers are staggered at 600 ms and 2200 ms after build.

### ⛔ CONNECTION LOST on Startup

`pulsebars()` now shows `CONNECTION LOST` in red immediately on first
render if the miner is unreachable — even before `hrhistory` has data.

---

## [5.2.2] — ᛃ JERA · The Dead Widget Falls
*April 3, 2026*

`lblstatus` (the bottom-bar status label) was removed entirely.
All `tryexcept` guards around `.config()` calls on it have been stripped.
The forge is quieter for the absence.

---

## [5.2.1] — ᚱ RAIDHO · Dead Weight Cast Into the Void
*April 3, 2026*

### 🗑️ Dead Code Purged

`_upd_pool_info()` — a 12-line function that was **never called** —
removed. It held the wrong API key and would have silently double-written
two labels had it ever been wired up.

### 🔇 Debug Prints Removed

| Location | Print | Risk |
|---|---|---|
| Settings watermark | `[WM] watermark drawn...` | Console noise |
| Settings apply | `[APPLY] Sending: {data}` | **Credential leak** |
| Settings apply | `[APPLY] PATCH {url} -> {code}` | HTTP debug noise |

The `[APPLY] Sending:` leak was the critical removal — miner IP and pool
credentials were printed in plain text on every Save.

---

## [5.2.0] — ᚨ ANSUZ · The Voice That Needs No Platform
*April 3, 2026*

> *Discord was cast into the ash. ntfy.sh took its throne.*

### ⚡ Discord → ntfy.sh

Discord webhooks replaced with **[ntfy.sh](https://ntfy.sh)** — free,
open-source, no account required. Setup takes 30 seconds:

1. Install the **ntfy** app on your phone (Android / iOS)
2. Open Settings → **NTFY.SH ALERTS**
3. Paste your topic URL: `https://ntfy.sh/your-secret-topic`
4. Hit **▶  TEST NOTIFY  (ntfy.sh)**
5. Done.

### 🐦‍⬛ Raven Position Fix

Huginn and Muninn lowered 24 px — they no longer clip the top bar.

### 🐛 Bugs Slain (5 total)

| Bug | Fix |
|---|---|
| `lbl_refresh_stat` AttributeError spam | `getattr` guard |
| Stale `color=` kwarg on milestone call | Removed |
| Stale `color=` kwarg on test button | Removed |
| `IndentationError` in milestone block | Block rebuilt |
| Latin-1 emoji header encoding | Non-ASCII stripped from Title |

---

## [3.9.4] — [3.9.9] — Foundation through Fortification

| Version | Name | Key Change |
|---|---|---|
| 3.9.9 | OTHALA | Rolling TCP ping · difficulty ≥ 50M alert |
| 3.9.8 | BERKANO | Pool user display · firmware label fix |
| 3.9.7 | HAGALAZ | Tray difficulty popup · thread exit fix |
| 3.9.6 | JERA | HR refresh var bug fix |
| 3.9.5 | INGWAZ | Ping display · stability · IP fallback |
| 3.9.4 | OTHALA | **Foundation** — first rune carved |

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
