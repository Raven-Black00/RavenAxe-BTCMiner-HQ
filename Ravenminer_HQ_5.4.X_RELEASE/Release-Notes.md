# RAVENMINER HQ — Release Notes

---

## [5.4.9] — ᛈ PERTHO · The Pulse Made Visible
*April 10, 2026*

> *The ping counter has always known the miner's heartbeat.*
> *Now the longhouse can see it.*

---

### ⚡ What's New in 5.4.9

This release replaces the static `ms` ping suffix with a living, breathing
ECG heart-rate graph — rendered with the same three-pass glow pipeline
as the hashrate history graph. Network latency is now as visual as
temperature. The number stays. The unit is gone. The pulse speaks for itself.

---

### 💓 ECG Heart-Rate Ping Graph

A new `tk.Canvas` waveform sits directly below the ping value label and
updates on every ping cycle from the rolling history buffer.

**Rendering (PIL path — recommended):**
- 2× LANCZOS supersampled image canvas — same anti-aliasing as the hashrate graph
- Three-pass glow rendering:
  | Pass | Width | Brightness |
  |---|---|---|
  | Haze | 14 px | 52% — outer diffuse bloom |
  | Bloom | 6 px | 88% — tight inner glow |
  | Core | 2 px | 100% — sharp bright line |
- Data-point dots every 3rd sample: filled colour circle + white centre
- Filled area polygon under the waveform for depth

**Rendering (fallback — no PIL):**
- Plain tkinter three-pass lines (7 px / 3 px / 1 px)
- Oval data dots with white centres
- Same visual language, no dependency required

---

### 🎨 Latency Colour Bands

The waveform automatically colour-codes from the current ping value:

| Band | Threshold | Colour |
|---|---|---|
| Swift | < 50 ms | Cyan `#00ffcc` — Sleipnir runs |
| Marginal | < 120 ms | Orange `#ffaa00` — Bifrost at dusk |
| Critical | ≥ 120 ms | Red `#ff3344` — Ragnarök approaches |

---

### 🔢 Ping Label — Numbers Only

The `ms` unit suffix has been removed from the ping value label.
The waveform shape conveys the unit — a flat line at the bottom means low ping;
a tall spike means high latency. The numeric value remains for precision.

---

## Archive — Previous Releases

## [5.4.0] — ᚢ URUZ · The Forge Reborn
*April 9, 2026*

> *RavenForge no longer merely builds — it breathes, pulses, and watches.*

This release transformed RavenForge from a plain build utility into a living
forge: Viking gold title pulse, drifting Elder Futhark particles, animated
Vegvisir compass, sweeping GlowLine borders, and a live icon preview picker.
A critical frozen-exe re-launch bug (BUG-F01) was also eliminated.

**Critical Bug Fixed — BUG-F01: Frozen .exe Re-Launch Loop**
When packaged with PyInstaller, every `pip install` and `pyinstaller`
subprocess re-launched `ravenforge.exe` instead of `python.exe`.
Fixed by resolving `PYTHON_EXE` at startup via `shutil.which("python")`.

---

## [5.2.10] — ᛟ OTHALA · The Longhouse Complete
*April 5, 2026*

> *Every column speaks. Every gauge breathes.*

Five gauges. WiFi diagnostics. Fan speed. Rolling averages. Source viewer.
The instrument panel reached full telemetry coverage in this release.

**New Gauges:**

| Gauge | Colour | Warn | Crit |
|---|---|---|---|
| ASIC TEMP | ORANGE | 55°C | 70°C |
| VR TEMP | CYAN | 50°C | 65°C |
| VOLTAGE | GREEN | 11.9 V | 11.5 V |
| CURRENT | ORANGE | 10.0 A | 12.0 A |

---

## [5.2.9] — ᛏ TIWAZ · The Reboot Made Honest
*April 4, 2026*

Reboot slide-to-confirm (toggle → slide → 2s hold).
Dashboard shows `CONNECTION LOST` immediately when reboot is confirmed.

---

## [5.2.8] — ᛒ BERKANO · The Best-Diff Breathes Blue
*April 4, 2026*

Best-Diff label now breathes slow blue and bounces red on a new personal
best. Label colour changed from GOLD to bright blue `#00aaff`.

---

## [5.2.5] — ᚺ HAGALAZ · The Runes Flank the Diff
*April 3, 2026*

Flanking Elder Futhark rune animations added left and right of Best-Diff
counter. `CONNECTION LOST` fires on startup when miner is unreachable.

---

## [5.2.2] — ᛃ JERA · The Dead Widget Falls
*April 3, 2026*

`lblstatus` bottom-bar label removed. Visual feedback handled by
`pulsebars()` / `livetick()`.

---

## [5.2.1] — ᚱ RAIDHO · Dead Weight Cast Into the Void
*April 3, 2026*

Dead function purged. Three debug prints removed — including a
**credential leak** (`[APPLY] Sending: {data}`) that printed miner IP
and pool credentials on every settings save.

---

## [5.2.0] — ᚨ ANSUZ · The Voice That Needs No Platform
*April 3, 2026*

Discord webhooks replaced with **ntfy.sh**. No account required.
One HTTP POST reaches any phone on Earth. Self-hosting supported.

---

## [3.9.4]–[4.0.0] — Foundation through Dawn

| Version | Key Change |
|---|---|
| 4.0.0 | Milestone alerts · clickable email header |
| 3.9.9 | Rolling TCP ping · difficulty ≥ 50M alert |
| 3.9.8 | Pool user display |
| 3.9.7 | Tray difficulty popup |
| 3.9.6 | HR refresh var bug fix |
| 3.9.5 | Ping display · stability |
| 3.9.4 | **Foundation** |

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
