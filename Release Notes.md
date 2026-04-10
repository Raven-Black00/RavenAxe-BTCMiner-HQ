# RAVENMINER HQ Release Notes — 5.5.1 GEBO — The Horn of Odin

**April 10, 2026**

The longhouse has always watched in silence. Now it speaks.

---

## What Is 5.5.1 GEBO?

**GEBO** — the gift rune. The exchange between warrior and god.  
This release gives the forge a voice: a Viking war-horn that rings on startup and every time a block is found. The audio is embedded in the script as Base64-encoded PCM WAV — it cannot be lost or forgotten.

---

## What's New

### Embedded Viking War-Horn (`STARTUP_WAV_B64`)
PCM WAV encoded in Base64, stored as a constant. No `.mp3` or `.wav` file needed beside the `.exe`.

### Startup Horn
`playstartupsound()` at the top of `__main__`. Daemon thread — UI init runs in parallel. You hear the horn as the longhouse opens.

### Block-Found Horn
Every time `foundBlocks` increases (`old_blocks >= 0` guard active), the horn fires alongside `_trigger_block_flash()`. Block found = flash + horn, simultaneously.

### Windows-Only, Fail-Silent
`winsound` import wrapped in `try/except`. `WINSOUND_OK` flag. Silent no-op on Linux/macOS.

---

## The Fix: Why It Was Silent Before

First build used `SND_MEMORY | SND_ASYNC`. Windows returned immediately, Python's GC freed `wav_bytes` before audio engine finished reading. Result: silence.

Fix: `SND_MEMORY` only. Blocking call inside daemon thread. Buffer stays alive. Horn rings true.

---

## Technical Summary

| Item | Detail |
|------|--------|
| Audio format | PCM WAV, 44100 Hz, mono, 16-bit |
| Delivery | Base64 constant embedded in script |
| Playback | `winsound.PlaySound(wav_bytes, winsound.SND_MEMORY)` |
| Threading | Daemon thread — UI never blocks |
| Trigger 1 | `__main__` startup |
| Trigger 2 | `new_blocks > old_blocks and old_blocks >= 0` |
| Non-Windows | Silent no-op via `WINSOUND_OK` |

---

```
R A V E N M I N E R   H Q   v 5 . 5 . 1
May your difficulty be low. May your uptime be eternal.
The ravens watch. The Allfather approves.
```
