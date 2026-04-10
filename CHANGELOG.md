## [5.5.1] — GEBO — The Horn of Odin — April 10, 2026

Every block found now rings across the longhouse.  
The war-horn is no longer a distant rumour — it is embedded, eternal, and bound to the forge.

### Added

- **GEBO — Embedded Viking War-Horn Audio**  
  A PCM WAV recording of a Viking war-horn is encoded as Base64 and embedded directly in the script. No external `.mp3` or `.wav` file is required for playback — the horn lives inside the forge itself.

- **GEBO — Startup Horn**  
  `playstartupsound()` fires in a daemon thread immediately when `__main__` launches. The UI initialises in parallel — startup time is unaffected.

- **GEBO — Block-Found Horn**  
  Every time `new_blocks > old_blocks` (and `old_blocks >= 0`), `playstartupsound()` fires alongside `_trigger_block_flash()`. The visual flash and the audio strike simultaneously. The `old_blocks >= 0` guard prevents a false trigger on the very first data load.

- **GEBO — Winsound Import Guard**  
  `winsound` is imported in a `try/except` block at module load. `WINSOUND_OK = True/False` controls all playback paths. On non-Windows platforms the function returns silently — the app continues without error.

### Fixed

- **GEBO — SND_ASYNC Garbage-Collection Silence**  
  Previous build used `SND_MEMORY | SND_ASYNC`. Windows returned immediately, Python freed `wav_bytes` before the audio engine finished reading the buffer, producing silence. Fixed: `SND_MEMORY` only, blocking call inside a daemon thread. Buffer lifetime is guaranteed for the full playback duration.

---

## [5.4.9] — PERTHO — The Pulse Made Visible — April 10, 2026

The ping no longer merely counts. It breathes. It spikes. It traces the heartbeat of the network.

### Added

- **PERTHO — ECG Heart-Rate Ping Graph** A `tk.Canvas` ECG-style waveform graph now lives below the ping value.
- **HAGALAZ — Three-Pass Glow Rendering (PIL Path)** 2× LANCZOS supersampled canvas; haze / bloom / core passes.
- **FEHU — Tkinter Fallback Renderer** Three-pass plain tkinter renderer when Pillow is absent.
- **LAGUZ — Latency Colour Bands** Swift ≤ 50 ms cyan, Marginal ≤ 120 ms orange, Critical > 120 ms red.

### Changed

- **NAUTHIZ — Ping Label ms Suffix Removed** Numeric value only; the ECG graph serves as the unit indicator.

---

## [5.4.0] — URUZ — The Forge Reborn — April 9, 2026

### Added

- URUZ Viking Regular title font with GDI registration and graceful fallback.
- PERTHO Pulsing gold title animation (25 fps, 8 gold keyframes).
- OTHALA Animated Vegvisir compass widget — rotating rune ring, pulsing spokes, breathing outer ring.
- RAIDHO Rune particle canvas — drifting Elder Futhark field beneath the title bar.
- GEBO Animated GlowLine title borders.
- WUNJO Icon chooser with 64×64 live canvas preview.
- TIWAZ Forge button idle pulse (gold breathe).
- NAUTHIZ Step row cyan pulse during active build.
- KENAZ Console rune ticker.
- SOWILO Side rune banners.

### Fixed

- **BUG-F01 — Frozen .exe Re-Launch Loop** `sys.executable` pointed to `ravenforge.exe` when frozen; all 8 subprocess calls now use `PYTHONEXE = shutil.which('python')`.

---

## [5.2.10] — OTHALA — The Longhouse Complete — April 5, 2026

### Added

- GEBO Source Code Viewer — syntax-highlighted scrollable reader.
- INGWAZ AVGWINDOW rolling average entry for CURRENT A and CORE VOLTAGE.
- BERKANO WiFi RSSI / SSID display.
- FEHU Fan speed display with animation speed scaling.
- DAGAZ VOLTAGE gauge (green needle, warn 11.9 V, crit 11.5 V).
- NAUTHIZ CURRENT gauge (orange needle, warn 10.0 A, crit 12.0 A).
- KENAZ Core voltage rolling average.
- RAIDHO Current A rolling average.

---

## [5.2.9] — TIWAZ — The Reboot Made Honest — April 4, 2026

### Fixed

- WUNJO Reboot forces `isOnline=False` immediately after command is issued.
- SOWILO Reboot slide-to-confirm: enable toggle → slide to 100 → hold 2 s.

---

## [5.2.8] — BERKANO — The Best-Diff Breathes Blue — April 4, 2026

### Added

- ISA Best-Diff slow blue breathe.
- RAIDHO Best-Diff red bounce on new personal best.
- NAUTHIZ Best-Diff string tracking.

### Changed

- OTHALA Best-Diff label colour `#00aaff`.

---

## [5.2.5] — HAGALAZ — The Runes Flank the Diff — April 3, 2026

### Added

- EHWAZ Best-Diff flanking rune animation (FEHU left, SOWILO right).
- KENAZ CONNECTION LOST fires on startup when miner is unreachable.

---

## [5.2.2] — JERA — The Dead Widget Falls — April 3, 2026

### Removed

- SOWILO `lblstatus` widget removed.

---

## [5.2.1] — RAIDHO — Dead Weight Cast Into the Void — April 3, 2026

### Removed / Fixed

- Dead function `updpoolinfo` purged.
- WM debug print removed.
- Credentials leak (`APPLY Sending data`) sealed.
- HTTP debug print removed.

---

## [5.2.0] — ANSUZ — The Voice That Needs No Platform — April 3, 2026

### Added

- ANSUZ ntfy.sh push notification system (Discord webhooks replaced).
- INGWAZ per-alert priority / emoji tags.
- TIWAZ TEST NOTIFY button in Settings.

---

## [4.0.0] — DAGAZ — Dawn of the New Forge

Milestone alerts, clickable email header.

---

## [3.9.4–3.9.9] — Foundation through Fortification

| Version | Rune | Key Change |
|---------|------|------------|
| 3.9.9 | OTHALA | Rolling TCP ping, difficulty 50M alert |
| 3.9.8 | BERKANO | Pool user display, firmware label fix |
| 3.9.7 | HAGALAZ | Tray difficulty popup, thread exit fix |
| 3.9.6 | JERA | HR refresh var bug fix |
| 3.9.5 | INGWAZ | Ping display stability, IP fallback |
| 3.9.4 | OTHALA | Foundation — first rune carved |

---

*Every rune carved here is a wound healed in the codeforge.*  
*HUGINN remembered the bug. MUNINN remembered the fix. ODIN merged them both.*
