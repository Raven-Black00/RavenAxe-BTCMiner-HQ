## [5.5.1] — GEBO — The Horn of Odin — April 10, 2026

Every block found now rings across the longhouse.

### Added

- **GEBO — Embedded Viking War-Horn Audio**  
  PCM WAV encoded as Base64, embedded directly in the script. No external file required.

- **GEBO — Startup Horn**  
  `playstartupsound()` fires in a daemon thread at `__main__` launch. UI initialises in parallel.

- **GEBO — Block-Found Horn**  
  `playstartupsound()` fires alongside `_trigger_block_flash()` when `new_blocks > old_blocks`. Guard `old_blocks >= 0` prevents false trigger on first load.

- **GEBO — Winsound Import Guard**  
  `WINSOUND_OK = True/False` controls all playback. Silent no-op on non-Windows.

### Fixed

- **GEBO — SND_ASYNC Garbage-Collection Silence**  
  Was: `SND_MEMORY | SND_ASYNC` → Windows returned immediately → Python freed `wav_bytes` → silence.  
  Fix: `SND_MEMORY` only, blocking inside daemon thread. Buffer stays alive for full playback.

---

## [5.4.9] — PERTHO — The Pulse Made Visible — April 10, 2026

### Added
- ECG Heart-Rate Ping Graph (three-pass glow, latency colour bands, data-point dots)
- Tkinter fallback renderer when Pillow absent

### Changed
- Ping label ms suffix removed — waveform speaks for itself

---

## [5.4.0] — URUZ — The Forge Reborn — April 9, 2026

### Added
- Viking Regular title font with GDI registration
- Pulsing gold title animation (25 fps)
- Animated Vegvisir compass widget
- Rune particle canvas
- Animated GlowLine title borders
- Icon chooser with live preview
- Forge button idle pulse

### Fixed
- **BUG-F01** Frozen .exe re-launch loop (`sys.executable` → `shutil.which('python')`)

---

## [5.2.10] — OTHALA — The Longhouse Complete — April 5, 2026

### Added
- Source Code Viewer
- AVGWINDOW rolling average entry
- WiFi RSSI / SSID display
- Fan speed display
- VOLTAGE gauge (green, warn 11.9V, crit 11.5V)
- CURRENT gauge (orange, warn 10.0A, crit 12.0A)

---

## [5.2.9] — TIWAZ — The Reboot Made Honest — April 4, 2026

### Fixed
- Reboot forces `isOnline=False` immediately
- Reboot slide-to-confirm: toggle → slide to 100 → hold 2s

---

## [5.2.8] — BERKANO — The Best-Diff Breathes Blue — April 4, 2026
- Best-Diff slow blue breathe, red bounce on new personal best, `#00aaff` label

## [5.2.5] — HAGALAZ — The Runes Flank the Diff — April 3, 2026
- Flanking rune animation, CONNECTION LOST on startup

## [5.2.2] — JERA — The Dead Widget Falls — April 3, 2026
- `lblstatus` widget removed

## [5.2.1] — RAIDHO — Dead Weight Cast Into the Void — April 3, 2026
- Dead code purged, credentials leak sealed

## [5.2.0] — ANSUZ — The Voice That Needs No Platform — April 3, 2026
- ntfy.sh replaces Discord

## [4.0.0] — DAGAZ — Dawn of the New Forge
- Milestone alerts, clickable email header

## [3.9.4–3.9.9] — Foundation through Fortification

| Version | Rune | Key Change |
|---------|------|------------|
| 3.9.9 | OTHALA | Rolling TCP ping, 50M alert |
| 3.9.8 | BERKANO | Pool user display |
| 3.9.7 | HAGALAZ | Tray difficulty popup |
| 3.9.6 | JERA | HR refresh var fix |
| 3.9.5 | INGWAZ | Ping stability |
| 3.9.4 | OTHALA | Foundation |

*Every rune carved here is a wound healed in the codeforge.*
